context("Check literal cites")

test_that("Returns no odd line numbers (False +vs)", {
  expect_true(!any(as.logical(which_literal_citations("./check-literal-cites/test-public.tex") %% 2)))
})

# Aspirational!
# test_that("All line numbers identified", {
#   lines <- readLines("./tests/testthat/check-literal-cites/test-public.tex", warn = FALSE)
#   line_nos_error <- which_literal_citations("./tests/testthat/check-literal-cites/test-public.tex")
#   even_line_nos <- seq.int(2L, length(lines), by = 2L)
#   
#   expect_identical(sort(union(which(nchar(lines) == 0L & (seq_along(lines) %% 2 == 0)), line_nos_error)),
#                    even_line_nos)
#   setdiff(even_line_nos, sort(union(which(nchar(lines) == 0L & (seq_along(lines) %% 2 == 0)), line_nos_error)))
# })
