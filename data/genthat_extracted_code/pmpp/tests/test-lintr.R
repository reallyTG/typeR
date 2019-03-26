context("lints")
library(lintr)

test_that("Package Style", {
  lints <- lintr::lint_package(
    linters = list(
      assignment = assignment_linter,
      closed_curly = closed_curly_linter(allow_single_line = TRUE),
      commas = commas_linter,
      infix_spaces = infix_spaces_linter,
      line_length = line_length_linter(120L),
      no_tab = no_tab_linter,
      object_length = object_length_linter(length = 40L),
      open_curly = open_curly_linter(allow_single_line = FALSE),
      single_quotes = single_quotes_linter,
      spaces_inside = spaces_inside_linter,
      triling_lines = trailing_blank_lines_linter,
      trailing_spaces = trailing_whitespace_linter,
      NULL
    ) %>% {
      .[!sapply(., is.null)]
    }
  )
  has_lints <- length(lints) > 0
  lint_output <- NULL
  if (has_lints) {
    lint_output <- sapply(lints, function(x) {
      paste(x$filename, x$line_number, x$column_number, paste0(x$type, " "), paste0(x$message, " "), sep = ":")
    })
    lint_output <- paste(collapse = "\n", lint_output)
  }
  testthat::expect(!has_lints, paste(sep = "\n", "Not lint free; use styler::style_pkg()", lint_output))
})
