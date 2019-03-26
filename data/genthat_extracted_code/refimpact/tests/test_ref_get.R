library(refimpact)
context("Testing ref_get")

test_that("non-valid API methods throw an error", {
  expect_error(ref_get("HelloWorld"))
  expect_error(ref_get("HelloWorld", 5))
  expect_error(ref_get("HelloWorld", query = list(UoA=1)))
})

test_that("ListInstituions API method returns tibble equal to reference", {
  skip_on_cran()
  expect_equal_to_reference(ref_get("ListInstitutions"), "ListInstitutions.rds")
})

test_that("ListTagTypes API method returns tibble equal to reference", {
  skip_on_cran()
  expect_equal_to_reference(ref_get("ListTagTypes"), "ListTagTypes.rds")
})

test_that("ListTagValues API method returns tibble equal to reference", {
  skip_on_cran()
  expect_equal_to_reference(ref_get("ListTagValues", 5), "ListTagValues.rds")
})

test_that("ListUnitsOfAssessment API method returns tibble equal to reference",{
  skip_on_cran()
  expect_equal_to_reference(ref_get("ListUnitsOfAssessment"), "ListUoA.rds")
})

test_that("SearchCaseStudies API method returns tibble equal to reference", {
  skip_on_cran()
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      UKPRN = 10007777
                                    )), "SearchCaseStudies_1.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      UoA = 1
                                    )), "SearchCaseStudies_2.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      tags = 11280
                                    )), "SearchCaseStudies_3.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      tags = c(11280, 5085)
                                    )), "SearchCaseStudies_4.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      phrase = "hello"
                                    )), "SearchCaseStudies_5.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      phrase = "research AND experiment"
                                    )), "SearchCaseStudies_6.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      ID = 15862
                                    )), "SearchCaseStudies_7.rds")
  expect_equal_to_reference(ref_get("SearchCaseStudies",
                                    query = list(
                                      ID = c(15862,42101)
                                    )), "SearchCaseStudies_8.rds")
})

test_that("API error messages are provided to the user", {
  skip_on_cran()
  expect_error(ref_get("SearchCaseStudies",
                       query = list(phrase = "research experiment")))
})

test_that("it returns a tibble", {
  skip_on_cran()
  expect_is(ref_get("SearchCaseStudies", query = list(ID = 15862)),"tbl_df")
  expect_is(ref_get("ListInstitutions"),"tbl_df")
  expect_is(ref_get("ListTagTypes"),"tbl_df")
  expect_is(ref_get("ListTagValues", 5),"tbl_df")
  expect_is(ref_get("ListUnitsOfAssessment"),"tbl_df")
})

