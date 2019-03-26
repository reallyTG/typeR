context("lio_user")
test_that("lio_user works", {
  skip_on_cran()
  
  a <- lio_user('ropensci')
  
  expect_is(a, "list")
  expect_equal(a$login, "ropensci")
  expect_equal(a$user_type, "Organisation")
  expect_equal(a$name, "rOpenSci")
})
test_that("lio_user fails well", {
  expect_error(lio_user(), "argument \"login\" is missing")
})


context("lio_user_repositories")
test_that("lio_user_repositories works", {
  skip_on_cran()
  
  a <- lio_user_repositories('ropensci', per_page = 3)
  
  expect_is(a, "data.frame")
  expect_is(a$full_name, "character")
  expect_match(a$full_name, "ropensci")
})
test_that("lio_user_repositories fails well", {
  expect_error(lio_user_repositories(), "argument \"login\" is missing")
  expect_error(lio_user_repositories("ropensci", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_user_repositories("ropensci", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})


context("lio_user_pkgs")
test_that("lio_user_pkgs works", {
  skip_on_cran()
  
  a <- lio_user_pkgs('ropensci', per_page = 3)
  
  expect_is(a, "data.frame")
  expect_match(a$homepage, "ropensci")
  expect_match(a$package_manager_url, "cran")
})
test_that("lio_user_pkgs fails well", {
  expect_error(lio_user_pkgs(), "argument \"login\" is missing")
  expect_error(lio_user_pkgs("ropensci", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_user_pkgs("ropensci", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})


context("lio_user_pkg_contributions")
test_that("lio_user_pkg_contributions works", {
  skip_on_cran()
  
  a <- lio_user_pkg_contributions('sckott', per_page = 3)
  
  expect_is(a, "data.frame")
  expect_is(a$normalized_licenses, "list")
  expect_is(a$versions, "list")
  expect_is(a$versions[[1]], "data.frame")
})
test_that("lio_user_pkg_contributions fails well", {
  expect_error(lio_user_pkg_contributions(), "argument \"login\" is missing")
  expect_error(lio_user_pkg_contributions("ropensci", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_user_pkg_contributions("ropensci", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})



context("lio_user_repo_contributions")
test_that("lio_user_repo_contributions works", {
  skip_on_cran()
  
  a <- lio_user_repo_contributions('sckott', per_page = 3)
  
  expect_is(a, "data.frame")
  expect_is(a$full_name, "character")
})
test_that("lio_user_repo_contributions fails well", {
  expect_error(lio_user_repo_contributions(), "argument \"login\" is missing")
  expect_error(lio_user_repo_contributions("ropensci", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_user_repo_contributions("ropensci", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})



context("lio_user_dependencies")
test_that("lio_user_dependencies works", {
  skip_on_cran()
  
  a <- lio_user_dependencies('ropensci', per_page = 3)
  
  expect_is(a, "data.frame")
  expect_is(a$dependents_count, "integer")
  expect_is(a$versions, "list")
})
test_that("lio_user_dependencies fails well", {
  expect_error(lio_user_dependencies(), "argument \"login\" is missing")
  expect_error(lio_user_dependencies("ropensci", page = "foobar"), 
    "page must be of class integer, numeric")
  expect_error(lio_user_dependencies("ropensci", per_page = "foobar"), 
    "per_page must be of class integer, numeric")
})
