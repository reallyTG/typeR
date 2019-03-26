context("lio_repo")
test_that("lio_repo works", {
  skip_on_cran()
  
  a <- lio_repo('ropensci', 'wellknown')
  
  expect_is(a, "list")
  expect_equal(a$full_name, "ropensci/wellknown")
  expect_equal(a$has_license, "LICENSE")
})
test_that("lio_repo fails well", {
  expect_error(lio_repo(), "argument \"owner\" is missing")
  expect_error(lio_repo("foobar"), "argument \"name\" is missing")
})


context("lio_repo_dependencies")
test_that("lio_repo_dependencies works", {
  skip_on_cran()
  
  a <- lio_repo_dependencies('ropensci', 'wellknown')
  
  expect_is(a, "list")
  expect_is(a$dependencies, "data.frame")
})
test_that("lio_repo_dependencies fails well", {
  expect_error(lio_repo_dependencies(), "argument \"owner\" is missing")
  expect_error(lio_repo_dependencies("foobar"), "argument \"name\" is missing")
})


context("lio_repo_projects")
test_that("lio_repo_projects works", {
  skip_on_cran()
  
  a <- lio_repo_projects('gruntjs', 'grunt', per_page = 2)
  
  expect_is(a, "data.frame")
  expect_is(a$name, "character")
  expect_equal(NROW(a), 2)
})
test_that("lio_repo_projects fails well", {
  expect_error(lio_repo_projects(), "argument \"owner\" is missing")
  expect_error(lio_repo_projects("foobar"), "argument \"name\" is missing")
  expect_error(lio_repo_projects("foo", "bar", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_repo_projects("foo", "bar", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})
