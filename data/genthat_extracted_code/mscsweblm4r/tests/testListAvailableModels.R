context("testListAvailableModels")

test_that("weblmListAvailableModels returns expected result structure", {

  skip_on_cran()

  res <- weblmListAvailableModels()

  expect_that(res, is_a("weblm"))
  expect_that(length(res), equals(3))
  expect_that(res[["request"]], is_a("request"))
  expect_that(res[["json"]], is_a("character"))
  expect_that(res[["results"]], is_a("data.frame"))
  expect_that(names(res[["results"]])[1], equals("corpus"))
  expect_that(names(res[["results"]])[2], equals("model"))
  expect_that(names(res[["results"]])[3], equals("maxOrder"))
})

test_that("weblmListAvailableModels fails with an error", {

  skip_on_cran()

  url <- mscsweblm4r:::weblmGetURL()
  key <- mscsweblm4r:::weblmGetKey()

  # URL: good, key: bad, expect error
  mscsweblm4r:::weblmSetKey("invalid-key")
  expect_that(weblmListAvailableModels(), throws_error())

  # URL: bad, key: bad, expect error
  mscsweblm4r:::weblmSetURL("invalid-URL")
  expect_that(weblmListAvailableModels(), throws_error())

  # URL: bad, key: good, expect error
  mscsweblm4r:::weblmSetKey(key)
  expect_that(weblmListAvailableModels(), throws_error())

  mscsweblm4r:::weblmSetURL(url)
})
