context("FSA-argchk")

test_that("formula", {
  expect_error(FSA(formula="abc~.", data=mtcars))
  expect_error(FSA(formula="mpg~.", data=mtcars), NA)
})

test_that("fitfunc", {
  expect_error(FSA(formula="mpg~.", data=mtcars, fitfunc=tempfile()))
  expect_error(FSA(formula="mpg~.", data=mtcars, fitfunc=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, fitfunc=lm), NA)
  expect_error(FSA(formula="vs~.", data=mtcars, fitfunc=glm), NA)
})

test_that("fixvar", {
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2,fixvar=tempfile()))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2,fixvar=c(1,2)))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2,fixvar=c("a","b")))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2,fixvar="cyl"),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2,fixvar=c("cyl","hp")),NA)
})

test_that("quad", {
  expect_error(FSA(formula="mpg~.", data=mtcars, quad=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, quad="a"))
  expect_error(FSA(formula="mpg~.", data=mtcars, quad=NA))
  expect_error(FSA(formula="mpg~.", data=mtcars, quad=NaN))
  expect_error(FSA(formula="mpg~.", data=mtcars, quad=TRUE),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, quad=FALSE),NA)
})

test_that("m", {
  expect_error(FSA(formula="mpg~.", data=mtcars, m=0))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=-1))
  expect_error(FSA(formula="mpg~.", data=mtcars, m="a"))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=NULL))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=NA))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=1,fixvar="vs"))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2),NA)
})

test_that("numrs", {
  expect_error(FSA(formula="mpg~.", data=mtcars, numrs=0))
  expect_error(FSA(formula="mpg~.", data=mtcars, numrs=-1))
  expect_error(FSA(formula="mpg~.", data=mtcars, numrs="a"))
  expect_error(FSA(formula="mpg~.", data=mtcars, numrs=NULL))
  expect_error(FSA(formula="mpg~.", data=mtcars, numrs=NA))
})

test_that("cores", {
  expect_error(FSA(formula="mpg~.", data=mtcars, cores=0))
  expect_error(FSA(formula="mpg~.", data=mtcars, cores=-1))
  expect_error(FSA(formula="mpg~.", data=mtcars, cores="a"))
  expect_error(FSA(formula="mpg~.", data=mtcars, cores=NULL))
  expect_error(FSA(formula="mpg~.", data=mtcars, cores=NA))
  if (.Platform$OS.type != "unix") {
    expect_warning(FSA(formula="mpg~.", data=mtcars, cores=2))
  }
})

test_that("interactions", {
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions="a"))
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions=NA))
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions=NaN))
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions=TRUE),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, interactions=FALSE),NA)
})

test_that("criterion", {
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=tempfile()))
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=1))
})

test_that("minmax", {
  expect_error(FSA(formula="mpg~.", data=mtcars, minmax="abc"))
  expect_error(FSA(formula="mpg~.", data=mtcars, minmax=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, minmax="mIN"),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, minmax="mAx"),NA)
})

test_that("criterion-minmax", {
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=AIC, minmax=c("abc","def")))
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=c(AIC,BIC), minmax="min"))
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=c(AIC,BIC), minmax=c("min","min")),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, criterion=c(AIC,BIC), minmax=list("min","min")),NA)
})

test_that("checkfeas", {
  expect_error(FSA(formula="mpg~.", data=mtcars, checkfeas=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, checkfeas=tempfile()))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2, checkfeas=c("cyl","disp","hp")))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2, checkfeas="cyl"))
  expect_error(FSA(formula="mpg~.", data=mtcars, m=2, checkfeas=c("cyl","disp")),NA)
})

test_that("var4int", {
  expect_error(FSA(formula="mpg~.", data=mtcars, var4int=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, var4int="abcxyz"))
  expect_error(FSA(formula="mpg~.", data=mtcars, var4int="disp"),NA)
})

test_that("min.nonmissing", {
  expect_error(FSA(formula="mpg~.", data=mtcars, min.nonmissing="abc"))
  expect_error(FSA(formula="mpg~.", data=mtcars, min.nonmissing=c(1,2)))
  expect_error(FSA(formula="mpg~.", data=mtcars, min.nonmissing=list("a","b")))
})

test_that("return.models", {
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models="abc"))
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models=1))
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models=NA))
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models=NaN))
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models=TRUE),NA)
  expect_error(FSA(formula="mpg~.", data=mtcars, return.models=FALSE),NA)
})

