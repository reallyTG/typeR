context("utilities")

test_that("qiita_util_tag test", {
  expect_equal(
    qiita_util_tag(name = "R", versions = ">3.1"),
    structure(list(name = "R", versions = I(">3.1")), class = c("qiita_tag", "list"))
  )
})

test_that("qiita_util_tag test without versions", {
  expect_equal(
    qiita_util_tag(name = "R"),
    structure(list(name = "R", versions = I(list())), class = c("qiita_tag", "list"))
  )
})

test_that("qiita_util_tag with multiple versions", {
  expect_equal(
    qiita_util_tag(name = "R", versions = c("3.1", "3.2")),
    structure(list(name = "R", versions = I(c("3.1", "3.2"))), class = c("qiita_tag", "list"))
  )
})



test_that("qiita_util_payload", {
  example_json <- '
{
  "body": "# Example",
  "title": "Example title",
  "tags": [
    {
      "name": "Ruby",
      "versions": [
        "0.0.1"
      ]
    }
  ],
  "private": false,
  "coediting": false
}'

  qiitr_json <- qiita_util_payload(body = "# Example",
                              coediting = FALSE,
                              private = FALSE,
                              tags = qiita_util_tag("Ruby", "0.0.1"),
                              title = "Example title")

  expect_equal(jsonlite::minify(qiitr_json),
               jsonlite::minify(example_json))
})

test_that("qiita_util_payload with multiple versions", {
  example_json <- '
{
  "body": "# Example",
  "title": "Example title",
  "tags": [
    {
      "name": "Ruby",
      "versions": [
        "0.0.1", "0.0.2"
      ]
    }
  ],
  "private": false,
  "coediting": false
}'

  qiitr_json <- qiita_util_payload(body = "# Example",
                              coediting = FALSE,
                              private = FALSE,
                              tags = qiita_util_tag("Ruby", c("0.0.1", "0.0.2")),
                              title = "Example title")

  expect_equal(jsonlite::minify(qiitr_json),
               jsonlite::minify(example_json))
})
