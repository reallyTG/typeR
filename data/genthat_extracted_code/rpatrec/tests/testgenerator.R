library(rpatrec)
context("Output_of_Generator")

test_that("Generator produces a timeseries with the right extrema",{
  a <- generator(plength=3,parts=c(0,25,50,75,100),sprd=c(0,80,40,80,0))
  expect_length(a,100)
  expect_lte(a[25],81)
  expect_gte(a[25],79)
})

test_that("pre and post-signal are correct",{
  a <- generator(presig=50,postsig=50,plength=3,parts=c(0,25,50,75,100),sprd=c(0,80,40,80,0))
  expect_length(a,200)
  expect_equal(a[4],0)
  expect_equal(a[175],a[176])
})
