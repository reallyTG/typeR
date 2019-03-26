context("testGenerateNextWords")

test_that("weblmGenerateNextWords returns expected result structure", {

  skip_on_cran()

  res <- weblmGenerateNextWords("how are you", "title")

  expect_that(res, is_a("weblm"))
  expect_that(length(res), equals(3))
  expect_that(res[["request"]], is_a("request"))
  expect_that(res[["json"]], is_a("character"))
  expect_that(res[["results"]], is_a("data.frame"))
  expect_that(names(res[["results"]])[1], equals("word"))
  expect_that(names(res[["results"]])[2], equals("probability"))
})

test_that("weblmGenerateNextWords fails with an error", {

  skip_on_cran()

  # precedingWords: bad, other params: good, expect error
  expect_that(weblmGenerateNextWords(precedingWords = 0, "title"), throws_error())

  # modelToUse: bad, other params: good, expect error
  expect_that(weblmGenerateNextWords("how are you", modelToUse = "invalid-model"), throws_error())

  # orderOfNgram: bad, other params: good, expect error
  expect_that(weblmGenerateNextWords("how are you", orderOfNgram = -1), throws_error())

  # maxNumOfCandidatesReturned: bad, other params: good, expect error
  expect_that(weblmGenerateNextWords("how are you", maxNumOfCandidatesReturned = -1), throws_error())

  url <- mscsweblm4r:::weblmGetURL()
  key <- mscsweblm4r:::weblmGetKey()

  # URL: good, key: bad, expect error
  mscsweblm4r:::weblmSetKey("invalid-key")
  expect_that(weblmGenerateNextWords("how are you", "title"), throws_error())

  # URL: bad, key: bad, expect error
  mscsweblm4r:::weblmSetURL("invalid-URL")
  expect_that(weblmGenerateNextWords("how are you", "title"), throws_error())

  # URL: bad, key: good, expect error
  mscsweblm4r:::weblmSetKey(key)
  expect_that(weblmGenerateNextWords("how are you", "title"), throws_error())

  mscsweblm4r:::weblmSetURL(url)
})
