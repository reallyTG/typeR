context("traitsearch")

test_that("traitsearch basic usage works", {
  skip_on_cran()
  
  a <- traitsearch(has_mass = TRUE, limit = 10, messages = FALSE)
  
  expect_is(a, "list")
  expect_named(a, c('meta', 'data'))
  expect_is(a$meta, 'list')
  expect_match(a$meta$submitted_query, 'hasmass')
  expect_is(a$data, 'tbl_df')
  expect_is(a$data$hasmass, 'character')
})

test_that("traitsearch pagination works", {
  skip_on_cran()
  
  a <- traitsearch(has_lifestage = TRUE, limit = 5, messages = FALSE)
  
  expect_is(a, "list")
  expect_named(a, c('meta', 'data'))
  expect_is(a$meta, 'list')
  expect_match(a$meta$submitted_query, 'haslifestage')
  expect_equal(NROW(a$data), 5)
})

test_that("traitsearch fails well", {
  skip_on_cran()
  
  # have to pass at least one trait parameter
  expect_error(traitsearch(), 
               'must specify one of the trait parameters')
  
  # assertion type check fails
  expect_error(traitsearch(has_mass = 5), 
               'has_mass must be of class logical')
  expect_error(traitsearch(has_length = "ASdfafd"), 
               'has_length must be of class logical')
  expect_error(traitsearch(has_sex = list(a = 5)), 
               'has_sex must be of class logical')
  expect_error(traitsearch(has_lifestage = mtcars), 
               'has_lifestage must be of class logical')
  expect_error(traitsearch(length_type = 5), 
               'length_type must be of class character')
})
