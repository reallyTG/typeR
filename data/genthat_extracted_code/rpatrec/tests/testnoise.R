library(rpatrec)
context("Output_of_noise")

test_that("output given standard inputs",{
  a <- seq(1:100)
  expect_equal(length(noise(a,"white",2)),length(a))
  expect_error(noise("ASD","white",2))
  expect_error(noise(a,"green",2))
  expect_error(noise(a,"white",c(1,2,3)))
  expect_length(noise(a,"red",3),100)
  expect_length(noise(a,"var",10),100)
})

test_that("output standard deviation is as required",{
  a <- seq(1:10000)
  b <- noise(a,"white",1)
  c <- sd(b-a)
  d <- (c > 0.85 && c < 1.15)
  expect_true(d)
  b <- noise(a,"var",10)
  c <- sd(b-a)
  d <- (c > 5.5 && 6.5)
  expect_true(d)
})
