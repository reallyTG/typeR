context("check_consecutive_words.R")

test_that("Error on known document", {
  skip("Too noisy")
  skip_on_cran()
  skip_on_travis()
  skip_if_not(nzchar(Sys.which("pdftotext")))
  expect_error(check_consecutive_words("consecutive-words",
                                       latex_file = "narrow-article.tex"))
  expect_output(tryCatch(check_consecutive_words("consecutive-words",
                                                latex_file = "narrow-article.tex"),
                        error = function(e) NULL),
                regexp = "'changes'\n\tserve this policy aim. Claims that the Budget")
  
})
