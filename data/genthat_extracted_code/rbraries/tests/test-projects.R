context("lio_project")
test_that("lio_project works", {
  skip_on_cran()
  
  a <- lio_project('npm', 'grunt')
  
  expect_is(a, "list")
  expect_is(a$versions, "data.frame")
  expect_equal(a$name, "grunt")
  expect_equal(a$platform, "NPM")
})
test_that("lio_project fails well", {
  expect_error(lio_project(), "argument \"platform\" is missing")
  expect_error(lio_project("npm"), "argument \"name\" is missing")
})


context("lio_project_dependencies")
test_that("lio_project_dependencies works", {
  skip_on_cran()
  
  a <- lio_project_dependencies('npm', 'grunt')
  
  expect_is(a, "list")
  expect_is(a$versions, "data.frame")
  expect_is(a$dependencies, "data.frame")
  expect_equal(a$name, "grunt")
  expect_equal(a$platform, "NPM")
})
test_that("lio_project_dependencies fails well", {
  expect_error(lio_project_dependencies(), "argument \"platform\" is missing")
  expect_error(lio_project_dependencies("npm"), "argument \"name\" is missing")
})


context("lio_project_dependents")
test_that("lio_project_dependents works", {
  skip_on_cran()
  
  a <- lio_project_dependents('npm', 'geojson-random')
  
  expect_is(a, "data.frame")
  expect_is(a$versions, "list")
  expect_is(a$versions[[1]], "data.frame")
})
test_that("lio_project_dependents fails well", {
  expect_error(lio_project_dependents(), "argument \"platform\" is missing")
  expect_error(lio_project_dependents("npm"), "argument \"name\" is missing")
})


context("lio_project_dependent_repos")
test_that("lio_project_dependent_repos works", {
  skip_on_cran()
  
  a <- lio_project_dependent_repos(platform='npm', name='geojson-random')
  
  expect_is(a, "data.frame")
})
test_that("lio_project_dependent_repos fails well", {
  expect_error(lio_project_dependent_repos(), "argument \"platform\" is missing")
  expect_error(lio_project_dependent_repos("npm"), "argument \"name\" is missing")
})



context("lio_project_contribs")
test_that("lio_project_contribs works", {
  skip_on_cran()
  
  a <- lio_project_contribs('npm', 'turf')
  
  expect_is(a, "data.frame")
  expect_is(a$name, "character")
  expect_true(any(grepl("Tom MacWright", a$name)))
  expect_gt(length(names(a)[names(a) %in% c('github_id', 'login', 'user_type', 'name')]), 1)
})
test_that("lio_project_contribs fails well", {
  expect_error(lio_project_contribs(), "argument \"platform\" is missing")
  expect_error(lio_project_contribs("npm"), "argument \"name\" is missing")
})



context("lio_project_sourcerank")
test_that("lio_project_sourcerank works", {
  skip_on_cran()
  
  a <- lio_project_sourcerank('npm', 'turf')
  
  expect_is(a, "list")
  expect_equal(a$basic_info_present, 1)
  expect_equal(a$follows_semver, 1)
})
test_that("lio_project_sourcerank fails well", {
  expect_error(lio_project_sourcerank(), "argument \"platform\" is missing")
  expect_error(lio_project_sourcerank("npm"), "argument \"name\" is missing")
})



context("lio_project_search")
test_that("lio_project_search works", {
  skip_on_cran()
  
  a <- lio_project_search(q = 'grunt')
  
  expect_equal(NROW(a), 30)
  expect_is(a, "data.frame")
  expect_is(a$versions, "list")
  expect_is(a$versions[[1]], "data.frame")
  expect_named(a$versions[[1]], c('number', 'published_at'))
})
test_that("lio_project_search fails well", {
  expect_error(lio_project_search(5), "q must be of class character")
  expect_error(lio_project_search(sort = 5), "sort must be of class character")
  expect_error(lio_project_search(languages = 5), "languages must be of class character")
  expect_error(lio_project_search(licenses = 5), "licenses must be of class character")
  expect_error(lio_project_search(keywords = 5), "keywords must be of class character")
  expect_error(lio_project_search(platforms = 5), "platforms must be of class character")
})
