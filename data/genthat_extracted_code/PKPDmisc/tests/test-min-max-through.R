context("min-max_through")

vec1 <- c(5, 4, 3, 4, 7, 1, 2, 1)
vec2 <- c(1, 2, 4, 3, 7, 1)

vec3 <- c(NA, 1, 3, 2)

vec1_mins <- c(5, 4, 3, 3, 3, 1, 1, 1)
vec1_maxes <- c(5, 5, 5, 5, 7, 7, 7, 7)

vec2_mins <- c(1, 1, 1, 1, 1,1)
vec2_maxes <- c(1, 2, 4, 4, 7, 7)

vec3_mins <- c(NA, 1, 1, 1)
vec3_maxes <- c(NA, 1, 3, 3)

test_that("min values properly calculated", {
  expect_equal(min_through(vec1), vec1_mins)
  expect_equal(min_through(vec2), vec2_mins)
})

test_that("max values properly calculated", {
  expect_equal(max_through(vec1), vec1_maxes)
  expect_equal(max_through(vec2), vec2_maxes)
})

test_that("NA's properly maintained", {
  expect_equal(min_through(vec3), vec3_mins)
  expect_equal(min_through(vec3), vec3_mins)
  expect_equal(max_through(vec3), vec3_maxes)
  expect_equal(max_through(vec3), vec3_maxes)
})