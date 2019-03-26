context("testBreakIntoWords")

if (!("package:mscsweblm4r" %in% search())) {
  library("mscsweblm4r")
  weblmInit()
} else {
  weblmInit()
}

test_that("weblmBreakIntoWords returns expected class type", {

  skip_on_cran()

  res <- weblmBreakIntoWords("testforwordbreak")
  expect_that(res, is_a("weblm"))
  expect_that(length(res), equals(3))
  expect_that(res[["request"]], is_a("request"))
  expect_that(res[["json"]], is_a("character"))
  expect_that(res[["results"]], is_a("data.frame"))
  expect_that(names(res[["results"]])[1], equals("words"))
  expect_that(names(res[["results"]])[2], equals("probability"))
})

test_that("weblmBreakIntoWords fails with an error", {

  skip_on_cran()

  # textToBreak: bad, other params: good, expect error
  expect_that(weblmBreakIntoWords(textToBreak = 0), throws_error())

  # modelToUse: bad, other params: good, expect error
  expect_that(weblmBreakIntoWords("testforwordbreak", modelToUse = "invalid-model"), throws_error())

  # orderOfNgram: bad, other params: good, expect error
  expect_that(weblmBreakIntoWords("testforwordbreak", orderOfNgram = -1), throws_error())

  # maxNumOfCandidatesReturned: bad, other params: good, expect error
  expect_that(weblmBreakIntoWords("testforwordbreak", maxNumOfCandidatesReturned = -1), throws_error())

  url <- mscsweblm4r:::weblmGetURL()
  key <- mscsweblm4r:::weblmGetKey()

  # URL: good, key: bad, expect error
  mscsweblm4r:::weblmSetKey("invalid-key")
  expect_that(weblmBreakIntoWords("testforwordbreak"), throws_error())

  # URL: bad, key: bad, expect error
  mscsweblm4r:::weblmSetURL("invalid-URL")
  expect_that(weblmBreakIntoWords("testforwordbreak"), throws_error())

  # URL: bad, key: good, expect error
  mscsweblm4r:::weblmSetKey(key)
  expect_that(weblmBreakIntoWords("testforwordbreak"), throws_error())

  mscsweblm4r:::weblmSetURL(url)
})
