# context("starring")

with_mock(
  "ThankYouStars:::get_pkgs_url" = function(...) c("https://github.com/ksmzn/ThankYouStars"),
  "ThankYouStars:::read_token" = function(...) NULL,
  "httr::PUT" = function(...) {
    list(..., status_code = 204)
  },
  test_that("starring repo", {
    expect_message(thank_you_stars(), "^Starred! https://github.com/ksmzn/ThankYouStars\\n$")
  })
)

with_mock(
  "ThankYouStars:::get_pkgs_url" = function(...) c("https://github.com/ksmzn/NotExistRepo"),
  "ThankYouStars:::read_token" = function(...) NULL,
  "httr::PUT" = function(...) {
    structure(list(
      content = readRDS('put_to_not_exist_repo.rds'),
      url = '',
      headers = list(`Content-Type` = "application/json;charset=utf-8"),
      status_code = 404
    ),
    class = "response")
  },
  test_that("failed starring to repo which is not found", {
    expect_message(thank_you_stars(), "^404 Not Found : https://github.com/ksmzn/NotExistRepo\\n$")
  })
)
