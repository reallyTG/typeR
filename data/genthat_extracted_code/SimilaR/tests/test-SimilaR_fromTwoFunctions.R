##    SimilaR package for R
##    Copyright (C) 2018 M. Bartoszuk, M. Gagolewski
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.

library("testthat")
library("SimilaR")
context("SimilaR_fromTwoFunctions")

test_that("simple_f1f2", {
  
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                   returnType = "data.frame",
                                                   aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_equal(nrow(dataFrameWithAssessment), 1)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromTwoFunctions) <= 0))
})

test_that("function1 is not a function", {
  
  f1 <- c(1,2,3)
  f2 <- function(x,y) {x+y}
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                      returnType = "data.frame",
                                                      aggregation = "sym"))
})

test_that("function2 is not a function", {
  
  f1 <- function(x) {x*x}
  f2 <- c(1,2,3)
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                      returnType = "data.frame",
                                                      aggregation = "sym"))
})

#############################
#############################

test_that("sym_dataframe", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                   returnType = "data.frame",
                                                   aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_equal(nrow(dataFrameWithAssessment), 1)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromTwoFunctions) <= 0))
})

test_that("tnorm_dataframe", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                   returnType = "data.frame",
                                                   aggregation = "tnorm")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_equal(nrow(dataFrameWithAssessment), 1)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromTwoFunctions) <= 0))
})

test_that("both_dataframe", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  dataFrameWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                      f2,
                                                      returnType = "data.frame",
                                                   aggregation = "both")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 5)
  expect_equal(nrow(dataFrameWithAssessment), 1)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromTwoFunctions12 + dataFrameWithAssessment$SimilaR_fromTwoFunctions21) <= 0))
})

######################################
######################################


test_that("sym_matrix", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  matrixWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                   f2,
                                                   returnType = "matrix",
                                                aggregation = "sym")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 2)
  expect_equal(nrow(matrixWithAssessment), 2)
  expect_true(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})

test_that("tnorm_matrix", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  matrixWithAssessment <- SimilaR_fromTwoFunctions(f1,
                                                   f2,
                                                returnType = "matrix",
                                                aggregation = "tnorm")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 2)
  expect_equal(nrow(matrixWithAssessment), 2)
  expect_true(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})

test_that("both_matrix", {
  f1 <- function(x) {x*x}
  f2 <- function(x,y) {x+y}
  
  matrixWithAssessment <- SimilaR_fromTwoFunctions(f1,f2,
                                                returnType = "matrix",
                                                aggregation = "both")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 2)
  expect_equal(nrow(matrixWithAssessment), 2)
  expect_false(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})