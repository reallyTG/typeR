library(retrodesign)
library(testthat)

context("output type")

test_that("output types are correct for retro_design.numeric", {
  expect_identical(class(retro_design(.5,1)),"list")
  expect_identical(class(retro_design(.5,1.1)),"list")
  expect_identical(class(retro_design(1,2)),"list")
  expect_identical(class(retro_design(-.5,1.1)),"list")
  expect_identical(class(retro_design(c(-.5,1,2),1.1)),"list")
})

test_that("output types are correct for retrodesign.numeric", {
  expect_identical(class(retrodesign(.5,1)),"list")
  expect_identical(class(retrodesign(.5,1.1)),"list")
  expect_identical(class(retrodesign(1,2)),"list")
  expect_identical(class(retrodesign(-.5,1.1)),"list")
  expect_identical(class(retrodesign(c(-.5,1,2),1.1)),"list")
})

test_that("output types are correct for retro_design.list", {
  expect_identical(class(retro_design(list(1,2,3,4),1)),"data.frame")
  expect_identical(class(retro_design(list(.1,-2,3,4),1.1)),"data.frame")
})

test_that("output types are correct for retrodesign.list", {
  expect_identical(class(retrodesign(list(1,2,3,4),1)),"data.frame")
  expect_identical(class(retrodesign(list(.1,-2,3,4),1.1)),"data.frame")
})

test_that("output types are correct for type_s", {
  expect_identical(class(type_s(.5,1)),"list")
  expect_identical(class(type_s(.5,1.1)),"list")
  expect_identical(class(type_s(1,2)),"list")
  expect_identical(class(type_s(-.5,1.1)),"list")
  expect_identical(class(type_s(c(-.5,1,2),1.1)),"list")
})

test_that("output types are correct for type_m", {
  expect_identical(class(type_m(.5,1)),"list")
  expect_identical(class(type_m(.5,1.1)),"list")
  expect_identical(class(type_m(1,2)),"list")
  expect_identical(class(type_m(-.5,1.1)),"list")
  expect_identical(class(type_m(c(-.5,1,2),1.1)),"list")
})

test_that("output types are correct for type_s.list", {
  expect_identical(class(type_s(list(1,2,3,4),1)),"data.frame")
  expect_identical(class(type_s(list(.1,-2,3,4),1)),"data.frame")
})

test_that("output types are correct for type_m.list", {
  expect_identical(class(type_m(list(1,2,3,4),1)),"data.frame")
  expect_identical(class(type_m(list(.1,-2,3,4),1.1)),"data.frame")
})
