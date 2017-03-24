module Ketcherails
  class KetcherController < ::ApplicationController

    skip_before_filter :authenticate_user!
    helper KetcherHelper
    layout false

    def index
      @template_categories = TemplateCategory.with_approved_templates
      @show_attachment_point = current_user.is_templates_moderator &&
                            (request.referer.to_s.include?('atom_abbreviations') ||
                               request.referer.to_s.include?('amino_acids'))

      @show_attachment_point2 = current_user.is_templates_moderator &&
                                   request.referer.to_s.include?('amino_acids')

      @atom_abbreviation_list = AtomAbbreviation.approved.pluck(:name)
    end
  end
end
