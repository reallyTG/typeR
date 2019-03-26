context("test-locate_latex_argument.R")

test_that("Locations", {
  Line1 <- "\\documentclass[11pt,parksip=half*]{scrartcl} "
  Pars1 <- parse_tex(Line1)
  out <- locate_mandatory_LaTeX_argument(parsed_doc = Pars1, command_name = "documentclass")
  expect_true("documentclass" %in% names(out))
  expect_equal(nrow(out), nrow(Pars1))
  expect_equal(out[(documentclass)][["column"]], 
               seq.int(from = nchar("\\documentclass[11pt,parksip=half*]{"),
                       to = nchar("\\documentclass[11pt,parksip=half*]{scrartcl}")))
})
