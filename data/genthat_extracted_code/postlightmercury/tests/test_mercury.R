library(postlightmercury)
library(testthat)
context("Testing web_parser()")

api_key <- NULL

check_api <- function() {
  if (is.null(api_key)) {
    skip("API key not available")
  }
}

if (!is.null(api_key)) {
  parsed_data <- web_parser(
    page_urls = "https://www.r-bloggers.com/how-and-when-ridge-regression-with-glmnet/",
    api_key = api_key
  )
}

test_that("the web parser works with one url", {
  check_api()
  expect_equal(dim(parsed_data), c(1, 14))
})

#

if (!is.null(api_key)) {
  urls <- c(
    "https://www.r-bloggers.com/how-and-when-ridge-regression-with-glmnet/",
    "http://www.dr.dk/nyheder/politik/ammitzboell-ingen-gyldne-haandtryk-i-den-offentlige-sektor",
    "https://www.b.dk/nationalt/da-kirkegaarden-blev-selfiernes-lyseroede-forlystelsespark"
  )

  parsed_data <- web_parser(
    page_urls = urls,
    api_key = api_key
  )
}

test_that("the web parser works with three urls", {
  check_api()
  expect_equal(dim(parsed_data), c(3, 14))
})

context("Testing remove_html()")

test_that("the html remover works", {
  check_api()
  clean_strings <- remove_html(parsed_data$content)

  expect_equal(length(clean_strings), 3)
  expect_equal(nchar(parsed_data$content) > nchar(clean_strings), c(TRUE, TRUE, TRUE))
})
