
context("define GLMP")

test_that("glmp has the correct values", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))
  g_depth <- function(u,y){ }

  pm_depth  <- pm(y=cp_depth, g=g_depth)
  glmp_method <- function(pm,input){ }
  my_glmp <- glmp(list(pm_depth),glmp_method)

  expect_that (class(my_glmp), equals("glmp"))
  expect_that(my_glmp$pm, equals(list(pm_depth)))
  expect_that(my_glmp$method, equals(glmp_method))

})

test_that("glmp error", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))
  g_depth <- function(u,y){ }

  pm_depth  <- pm(y=cp_depth, g=g_depth)
  glmp_method <- function(pm,input){ }

  #error the parameter pms must be an instance of the list class
  expect_error(glmp(cp_depth,glmp_method))
  #error the pms parameter must contain instances of pm class
  expect_error(glmp(list(cp_depth),glmp_method))
 #error the parameter method must be a function.
  expect_error(glmp(list(pm_depth),5))


})
