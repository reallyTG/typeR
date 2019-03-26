## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----add-template, eval = FALSE------------------------------------------
#  usethis::use_rmarkdown_template(
#    template_name = "Curriculum Vitae (ModernCV format)",
#    template_dir = "my_template",
#    template_description = "The ModernCV template (https://github.com/xdanaux/moderncv) for vitae",
#    template_create_dir = TRUE)

## ------------------------------------------------------------------------
#' @rdname cv_formats
#' @export
moderncv <- function(...) {
  template <- system.file("rmarkdown", "templates", "my_template",
                          "resources", "moderncv.tex", package="vitae")
  copy_supporting_files("my_template")
  cv_document(..., template = template, citation_package="biblatex", latex_engine="xelatex")
}

