doi1 <- "10.1108/jd-12-2013-0166"
pmid1 <- 30446726
pmcid1 <- "PMC4679344"
isbn1 <- 1439895619

context("cit_oid_: DOI")
test_that("cit_oid_ DOI", {
  skip_on_cran()
  x <- cit_oid_(doi1)

  expect_is(x, "list")
  expect_is(x[[1]], "character")
  expect_is(attr(x[[1]], "type"), "character")
  expect_equal(attr(x[[1]], "type"), "json")
  expect_match(x[[1]], doi1)
})


context("cit_oid_: PMID")
test_that("cit_oid_ PMID", {
  skip_on_cran()
  x <- cit_oid_(pmid1)

  expect_is(x, "list")
  expect_is(x[[1]], "character")
  expect_is(attr(x[[1]], "type"), "character")
  expect_equal(attr(x[[1]], "type"), "json")
  expect_match(x[[1]], "10.1038/s41385-018-0109-1")
  expect_match(x[[1]], as.character(pmid1))
})


context("cit_oid_: ISBN")
test_that("cit_oid_ ISBN", {
  skip_on_cran()
  x <- cit_oid_(isbn1)

  expect_is(x, "list")
  expect_is(x[[1]], "character")
  expect_is(attr(x[[1]], "type"), "character")
  expect_equal(attr(x[[1]], "type"), "json")
  expect_true(grepl(isbn1, x[[1]]))
})


context("cit_oid_: PMCID")
test_that("cit_oid_ PMCID", {
  skip_on_cran()
  x <- cit_oid_(pmcid1)

  expect_is(x, "list")
  expect_is(x[[1]], "character")
  expect_is(attr(x[[1]], "type"), "character")
  expect_equal(attr(x[[1]], "type"), "json")

  expect_match(x[[1]], "10.1097/IGC.0000000000000609")
  expect_match(x[[1]], "26645990")
  expect_match(x[[1]], pmcid1)
})


context("cit_oid_: many ids")
test_that("cit_oid_ many ids", {
  skip_on_cran()
  x <- cit_oid_(id = c(pmid1, pmcid1, isbn1))
  
  expect_equal(length(x), 3)
  expect_is(x, "list")
  expect_is(x[[1]], "character")
  expect_is(x[[2]], "character")
  expect_is(x[[3]], "character")
  expect_named(x, NULL)
})

test_that("cit_oid_ fails well", {
  expect_error(cit_oid_(), "argument \"id\" is missing")
  expect_error(cit_oid_(mtcars), "id must be of class")
})
