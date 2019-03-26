doi1 <- "10.1108/jd-12-2013-0166"
pmid1 <- 30446726
pmcid1 <- "PMC4679344"
isbn1 <- 1439895619

context("cit_oid: DOI")
test_that("cit_oid DOI", {
  skip_on_cran()
  x <- cit_oid(doi1)

  expect_is(x, "list")
  expect_is(x[[1]]$key, "character")
  expect_is(x[[1]]$url, "character")
  expect_equal(x[[1]]$DOI, doi1)
})


context("cit_oid: PMID")
test_that("cit_oid PMID", {
  skip_on_cran()
  x <- cit_oid(pmid1)

  expect_is(x, "list")
  expect_is(x[[1]]$key, "character")
  expect_is(x[[1]]$url, "character")
  expect_equal(x[[1]]$DOI, "10.1038/s41385-018-0109-1")
  expect_equal(x[[1]]$PMID, as.character(pmid1))
})


context("cit_oid: ISBN")
test_that("cit_oid ISBN", {
  skip_on_cran()
  x <- cit_oid(isbn1)

  expect_is(x, "list")
  expect_null(x[[1]]$key)
  expect_is(x[[1]]$url, "character")
  expect_null(x[[1]]$DOI)
  expect_null(x[[1]]$PMID)
  expect_is(x[[1]]$ISBN, "list")
  expect_equal(length(x[[1]]$ISBN), 2)
})


context("cit_oid: PMCID")
test_that("cit_oid PMCID", {
  skip_on_cran()
  x <- cit_oid(pmcid1)

  expect_is(x, "list")
  expect_is(x[[1]]$key, "character")
  expect_is(x[[1]]$url, "character")
  expect_equal(x[[1]]$DOI, "10.1097/IGC.0000000000000609")
  expect_equal(x[[1]]$PMID, "26645990")
  expect_equal(x[[1]]$PMCID, pmcid1)
  expect_is(x[[1]]$author, "list")
  expect_is(x[[1]]$author[[1]], "list")
  expect_is(unlist(x[[1]]$author[[1]]), "character")
})


context("cit_oid: many ids")
test_that("cit_oid many ids", {
  skip_on_cran()
  x <- cit_oid(id = c(pmid1, pmcid1, isbn1))

  expect_is(x, "list")
  expect_equal(length(x), 3)
  expect_named(x, NULL)
  expect_is(x[[1]], "list")
  expect_is(x[[2]], "list")
  expect_is(x[[3]], "list")
})



test_that("cit_oid fails well", {
  expect_error(cit_oid(), "argument \"id\" is missing")
  expect_error(cit_oid(mtcars), "id must be of class")
})
