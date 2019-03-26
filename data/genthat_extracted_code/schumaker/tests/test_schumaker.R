library(schumaker)
library(testthat)

context("Testing the schumaker package")

x = c(-3,-1,-0.5,0)
y = c(0, 0.007, 2, 5)

sp_all = Schumaker(x,y)
sp = sp_all$Spline
sp1 = sp_all$DerivativeSpline
sp2 = sp_all$SecondDerivativeSpline

xarray = seq(min(x), max(x), length.out = 500)
yarray0 = sp(xarray)
yarray1 = sp1(xarray)
yarray2 = sp2(xarray)

test_that("The bug: Testing that all second derivatives are positive. Some values and gradients might be negative however", {
  expect_true((!(all(yarray0 >= 0))))
  expect_true((!(all(yarray1 >= 0))))
  expect_true(all(yarray2 >= 0))
})

sp_all = Schumaker(x,y, edgeGradients = c(0,NA) )
sp = sp_all$Spline
sp1 = sp_all$DerivativeSpline
sp2 = sp_all$SecondDerivativeSpline

xarray = seq(min(x), max(x), length.out = 500)
yarray0 = sp(xarray)
yarray1 = sp1(xarray)
yarray2 = sp2(xarray)

test_that("The bug: Testing that edgeGradients Fixes it", {
  expect_true(((all(yarray0 >= 0))))
  expect_true(((all(yarray1 >= 0))))
  expect_true(((all(yarray2 >= 0))))
})


x = c(-3,-2,-1,0)
y = c(0, 0.5, 2, 5)

sp_all = Schumaker(x,y)
sp = sp_all$Spline
sp1 = sp_all$DerivativeSpline
sp2 = sp_all$SecondDerivativeSpline

xarray = seq(min(x), max(x), length.out = 500)
yarray0 = sp(xarray)
yarray1 = sp1(xarray)
yarray2 = sp2(xarray)

yarray_numderiv1 = numDeriv::grad(sp, xarray)
yarray_numderiv2 = numDeriv::grad(sp1, xarray)

tol = 1e-7

test_that("Testing that numerical derivatives match well with analytic", {
  expect_true(((all(yarray0 >= 0))))
  expect_true(((all(yarray1 >= 0))))
  expect_true(((all(yarray_numderiv1 >= 0))))
  expect_true(((all(abs(yarray1 - yarray_numderiv1) < tol))))
  expect_true(((all(yarray2 >= 0))))
  expect_true(((all(yarray_numderiv2 >= 0))))
  expect_true(((all(abs(yarray2 - yarray_numderiv2) < tol))))
})

test_that("Check Interpolation", {
  expect_true(abs(sp(x[1]) -  y[1]) < tol)
  expect_true(abs(sp(x[2]) -  y[2]) < tol)
  expect_true(abs(sp(x[3]) -  y[3]) < tol)
  expect_true(abs(sp(x[4]) -  y[4]) < tol)
})

