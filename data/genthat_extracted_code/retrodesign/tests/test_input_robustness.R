library(testthat)
library(retrodesign)

context("Make sure functions respond correctly to positive, negative,
        and impossible inputs")

test_that("all functions reject negative standard error", {
  expect_error(retro_design(.5,-1))
  expect_error(retrodesign(.5,-1))
  expect_error(retro_design(list(.5,1,2),-1))
  expect_error(retrodesign(list(.5,1,2),-1))
  expect_error(type_s(.5,-1))
  expect_error(type_m(.5,-1))
  expect_error(type_s(list(.5,1,2),-1))
  expect_error(type_m(list(.5,1,2),-1))

})

test_that("type M error is always a positive ratio", {
  # This is assumed to be true by Lu et al. (2018) and Gelman & Carlin (2014),
  # but making it work explicitly in the package required some modifications.
  expect_gte(retrodesign(-.5,1)$exaggeration,0)
  expect_gte(retro_design(-.5,1)$typeM,0)
  expect_gte(unlist(retro_design(list(-.5,-1,-2),1)$type_m[2]),0)
  expect_gte(unlist(retrodesign(list(-.5,-1,-2),1)$type_m[2]),0)
  expect_gte(unlist(type_m(-.5,1)),0)
  expect_gte(unlist(type_m(list(-.5,-1,-2),1)$type_m[2]),0)

})

test_that("type M error is always a positive ratio", {
  # This is assumed to be true by Lu et al. (2018) and Gelman & Carlin (2014),
  # but making it work explicitly in the package required some modifications.
  expect_gte(retrodesign(-.5,1)$exaggeration,0)
  expect_gte(retro_design(-.5,1)$typeM,0)
  expect_gte(unlist(retro_design(list(-.5,-1,-2),1)$type_m[2]),0)
  expect_gte(unlist(retrodesign(list(-.5,-1,-2),1)$type_m[2]),0)
  expect_gte(unlist(type_m(-.5,1)),0)
  expect_gte(unlist(type_m(list(-.5,-1,-2),1)$type_m[2]),0)

})

test_that("type S error works for negative numbers", {
  # Type S should be P(negative estimate|positive true effect), and vice
  # versa for negative true effects.
  # we can easily test this by symmetry
  expect_equal(retrodesign(-.5,1)$typeS,
                   retrodesign(.5,1)$typeS)
  expect_equal(retro_design(-.5,1)$typeS,
                   retro_design(.5,1)$typeS)
  expect_equal(unlist(retro_design(list(-.5,-1,-2),1)$type_s[2]),
                   unlist(retro_design(list(.5,1,2),1)$type_s[2]))
  expect_equal(unlist(retrodesign(list(-.5,-1,-2),1)$type_s[2]),
                   unlist(retrodesign(list(.5,1,2),1)$type_s[2]))
  expect_equal(unlist(type_s(-.5,1)),
                   unlist(type_s(.5,1)))
  expect_equal(unlist(type_s(list(-.5,-1,-2),1)$type_s[2]),
                   unlist(type_s(list(.5,1,2),1)$type_s[2]))

})
