context("Citation formatting")

test_that("Postnotes detected", {
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/cite-no-postnote.tex"), regexp = "postnote")
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/cite-p-in-postnote.tex"), regexp = "p in postnote")
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/cite-pp-in-postnote.tex"), regexp = "p in postnote")
})

# test_that("Tweetable check_cite", {
#   skip_if_not(file.exists("~/twitteR/grattan-reporter.R"))
#   source("~/twitteR/grattan-reporter.R")
#   expect_error(checkGrattanReport(path = "./twitter/", output_method = "twitter"))
#   expect_true(deleteStatus(.last.Twitter.status[[1]]))
#   rm(".last.Twitter.status", inherits = TRUE, envir = .GlobalEnv)
# })


test_that("Singular text/footcite with two keys should error", {
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/29-bad-singular-cite.tex"),
               regexp = "Use of singular form")
})


test_that("Page reference ok if in correct format", {
  expect_null(check_cite_pagerefs("./check-cite-pagerefs/ok-page-ref-roman.tex"))
  expect_null(check_cite_pagerefs("./check-cite-pagerefs/cite-p-in-text-postnote.tex"))
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/bad-cite-p-in-text-postnote-2.tex"), regexp = "Page reference not in correct format")
  expect_error(check_cite_pagerefs("./check-cite-pagerefs/bad-cite-p-in-text-postnote.tex"), regexp = "Page reference not in correct format")
})
