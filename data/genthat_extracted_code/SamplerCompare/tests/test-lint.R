bad_linters <- c("multiple_dots_linter", "commas_linter",
                 "spaces_left_parentheses_linter")
if (Sys.getenv("NOT_CRAN") == "true") {
  linter_mask <- !(names(lintr::default_linters) %in% bad_linters)
  # Not all files pass yet, but keep the ones that do passing.
  for (f in c("../../R/compare-samplers.R", "../../R/00dist-util.R",
              "../../R/act.R", "../../R/chud.R", "../../R/util.R")) {
    lintr::lint(f, linters = lintr::default_linters[linter_mask])
  }
}
