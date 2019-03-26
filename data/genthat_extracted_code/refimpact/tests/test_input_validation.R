library(refimpact)
context("Testing Input Validation for ListTagValues and tag_type")

test_that("api_method values other than ListTagValues give an error if tag_value
          is provided", {
  expect_error(ListTagValues_validate("ListInstitutions", 5))
  expect_error(ListTagValues_validate("ListTagTypes", 5))
  expect_error(ListTagValues_validate("ListUnitsOfAssessment", 5))
  expect_error(ListTagValues_validate("SearchCaseStudies", 5))
})

test_that("api_method values other than ListTagValues give no error if tag_value
          is NULL", {
  expect_silent(ListTagValues_validate("ListInstitutions", NULL))
  expect_silent(ListTagValues_validate("ListTagTypes", NULL))
  expect_silent(ListTagValues_validate("ListUnitsOfAssessment", NULL))
  expect_silent(ListTagValues_validate("SearchCaseStudies", NULL))
})

test_that("api_method value of ListTagValues gives no error if tag_value is
          provided", {
  expect_silent(ListTagValues_validate("ListTagValues", 5))
})

test_that("api_method value of ListTagValues gives an error if tag_value is
          NULL", {
  expect_error(ListTagValues_validate("ListTagValues", NULL))
})

test_that("useful error if unseen tag_value is provided to ListTagValues", {
  expect_error(ListTagValues_validate("ListTagValues", 2), "*tag_type*")
})

context("Testing validation for SearchCaseStudies")

test_that("non-list queries throw an error", {
  expect_error(SearchCaseStudies_prepare("UKPRN"), "list")
  expect_error(SearchCaseStudies_prepare(c("UKPRN" = 10000777)), "list")
  expect_error(SearchCaseStudies_prepare(10L), "list")
  expect_error(SearchCaseStudies_prepare(10.5), "list")
  expect_error(SearchCaseStudies_prepare(as.factor("UKPRN")), "list")
  expect_error(SearchCaseStudies_prepare(data.frame(UKPRN = 10000777)), "list")
})

test_that("empty lists throw an error", {
  expect_error(SearchCaseStudies_prepare(list()), "list")
})

test_that("list elements without names throws an error", {
  expect_error(SearchCaseStudies_prepare(list("hello")))
  expect_error(SearchCaseStudies_prepare(list("hello", UKPRN="12345")))
  expect_error(SearchCaseStudies_prepare(list(UKPRN="12345", "hello")))
})

test_that("list elements with unacceptable names throw an error", {
  expect_error(SearchCaseStudies_prepare(list(hello=1)))
  expect_error(SearchCaseStudies_prepare(list(UKPRN=1, hello=1)))
})

test_that("list elements with acceptable names and parameters throw no error or
          warning", {
  # a few random tests
  expect_silent(SearchCaseStudies_prepare(list(ID=1)))
  expect_silent(SearchCaseStudies_prepare(list(ID=c(1:10))))
  expect_silent(SearchCaseStudies_prepare(list(UKPRN=10007777)))
  expect_silent(SearchCaseStudies_prepare(list(UoA=1)))
  expect_silent(SearchCaseStudies_prepare(list(tags=5083)))
  expect_silent(SearchCaseStudies_prepare(list(tags=c(5083, 5086))))
  expect_silent(SearchCaseStudies_prepare(list(phrase = "hello")))
  expect_silent(SearchCaseStudies_prepare(list(phrase = "hello world")))
})

test_that("non-integer IDs throw an error", {
  expect_error(SearchCaseStudies_prepare(list(ID=1.5)), "ID")
  expect_error(SearchCaseStudies_prepare(list(ID="hello")), "ID")
})

test_that("unseen UKPRNs throw an error", {
  expect_error(SearchCaseStudies_prepare(list(UKPRN=1)), "UKPRN")
  expect_error(SearchCaseStudies_prepare(list(UKPRN=1.5)), "UKPRN")
  expect_error(SearchCaseStudies_prepare(list(UKPRN="hello")), "UKPRN")
})

test_that("unseen UOAs throw an error", {
  expect_error(SearchCaseStudies_prepare(list(UoA=10000000)), "UoA")
  expect_error(SearchCaseStudies_prepare(list(UoA=1.5)), "UoA")
  expect_error(SearchCaseStudies_prepare(list(UoA="hello")), "UoA")
})

test_that("unseen tags throw an error", {
  expect_error(SearchCaseStudies_prepare(list(tags=1)), "tags")
  expect_error(SearchCaseStudies_prepare(list(tags=1.5)), "tags")
  expect_error(SearchCaseStudies_prepare(list(tags="hello")), "tags")
  expect_error(SearchCaseStudies_prepare(list(tags=c(1,5083))), "tags")
  expect_error(SearchCaseStudies_prepare(list(tags=c(5083,1))), "tags")
})

context("Testing query preparation for SearchCaseStudies")

test_that("ID query modifier works", {
  expect_equal(SearchCaseStudies_prepare(list(ID = 1855)),
               list(ID = 1855))
  expect_equal(SearchCaseStudies_prepare(list(ID = c(1855, 1856))),
               list(ID = "1855,1856"))
  expect_equal(SearchCaseStudies_prepare(list(ID = c(1855, 1856, 2582))),
               list(ID = "1855,1856,2582"))
})

test_that("tags query modifier works", {
  expect_equal(SearchCaseStudies_prepare(list(tags = 5083)),
               list(tags = 5083))
  expect_equal(SearchCaseStudies_prepare(list(tags = c(5083, 5086))),
               list(tags = "5083,5086"))
})

test_that("ID with other params gives warning but returns sensible ID", {
  expect_equal(suppressWarnings(SearchCaseStudies_prepare(list(ID = c(1855,
                                                                      1856,
                                                                      2582),
                                              tags = 5083))),
               list(ID = "1855,1856,2582"))
  expect_warning(SearchCaseStudies_prepare(list(ID = c(1855, 1856, 2582),
                                                tags = 5083)), "*ignored*")
})
