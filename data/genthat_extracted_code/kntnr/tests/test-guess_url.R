context("guess_url")

test_that("guessing URLs works", {
  urls <- c(
    "example.cybozu.com",
    "http://example.cybozu.com",
    "https://example.cybozu.com",
    "https://example.cybozu.com/",
    "https://example.cybozu.com/k/v1"
    )

  expect_true(
    all(
      purrr::map_chr(urls, guess_url) == "https://example.cybozu.com/"
    )
  )
})
