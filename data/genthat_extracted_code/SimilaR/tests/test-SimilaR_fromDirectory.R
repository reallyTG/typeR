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
context("SimilaR_fromDirectory")

test_that("simple_file", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME) #file.path(maindir,"tests","testthat", "data")
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                     fileTypes="file",
                                     aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
  expect_equal(table(dataFrameWithAssessment$decision), table(c(rep(0,81),rep(1,10))))
})

test_that("simple_file_data2", {
  dirname = system.file("testdata","data2",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                     fileTypes="file",
                                     aggregation = "both")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 5)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory12 + dataFrameWithAssessment$SimilaR_fromDirectory21) <= 0))
  expect_equal(nrow(dataFrameWithAssessment), 16)
})

test_that("simple_function_data2", {
  dirname = system.file("testdata","data2",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                                              fileTypes="function",
                                                              aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
  expect_equal(nrow(dataFrameWithAssessment), 21)
})


test_that("simple_function", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                     fileTypes="file",
                                     aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
  expect_equal(nrow(dataFrameWithAssessment), 91)
})

####################
####################

test_that("notParsing", {
  dirname = system.file("testdata","data_notParsing",package=PACKAGE_NAME)
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                                  returnType = "data.frame",
                                                              fileTypes="function",
                                                              aggregation = "sym"))
})

test_that("emptyDirectory", {
  dirname = system.file("testdata","data_empty",package=PACKAGE_NAME)
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                                                returnType = "data.frame",
                                                                fileTypes="function",
                                                                aggregation = "sym"))
})

test_that("notExistingDirectory", {
  dirname = system.file("testdata","data_notExists",package=PACKAGE_NAME)
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                                                returnType = "data.frame",
                                                                fileTypes="function",
                                                                aggregation = "sym"))
})

test_that("oneFile_function", {
  dirname = system.file("testdata","data_oneFile",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                                                returnType = "data.frame",
                                                                fileTypes="function",
                                                                aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_equal(nrow(dataFrameWithAssessment), 3)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
})

test_that("oneFile_file", {
  dirname = system.file("testdata","data_oneFile",package=PACKAGE_NAME)
  
  expect_error(dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                                                returnType = "data.frame",
                                                                fileTypes="file",
                                                                aggregation = "sym"))
  
})

#############################
#############################

test_that("sym_dataframe", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                                              fileTypes="file",
                                                              aggregation = "sym")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
  expect_equal(table(dataFrameWithAssessment$decision), table(c(rep(0,81),rep(1,10))))
})

test_that("tnorm_dataframe", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                                              fileTypes="file",
                                                              aggregation = "tnorm")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 4)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory) <= 0))
  expect_equal(table(dataFrameWithAssessment$decision), table(c(rep(0,81),rep(1,10))))
})

test_that("both_dataframe", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  dataFrameWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "data.frame",
                                                              fileTypes="file",
                                                              aggregation = "both")
  expect_true(is.data.frame(dataFrameWithAssessment))
  expect_equal(ncol(dataFrameWithAssessment), 5)
  expect_true(all(diff(dataFrameWithAssessment$SimilaR_fromDirectory12 + dataFrameWithAssessment$SimilaR_fromDirectory21) <= 0))
  expect_equal(table(dataFrameWithAssessment$decision), table(c(rep(0,81),rep(1,10))))
})

######################################
######################################


test_that("sym_matrix", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  matrixWithAssessment <- SimilaR_fromDirectory(dirname,
                                     returnType = "matrix",
                                     fileTypes="file",
                                     aggregation = "sym")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 14)
  expect_equal(nrow(matrixWithAssessment), 14)
  expect_true(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})

test_that("tnorm_matrix", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  matrixWithAssessment <- SimilaR_fromDirectory(dirname,
                                  returnType = "matrix",
                                  fileTypes="file",
                                  aggregation = "tnorm")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 14)
  expect_equal(nrow(matrixWithAssessment), 14)
  expect_true(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})

test_that("both_matrix", {
  dirname = system.file("testdata","data",package=PACKAGE_NAME)
  
  matrixWithAssessment <- SimilaR_fromDirectory(dirname,
                                  returnType = "matrix",
                                  fileTypes="file",
                                  aggregation = "both")
  expect_true(is.matrix(matrixWithAssessment))
  expect_equal(ncol(matrixWithAssessment), 14)
  expect_equal(nrow(matrixWithAssessment), 14)
  expect_false(isSymmetric(matrixWithAssessment))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment >= 0))
  expect_true(all(is.na(matrixWithAssessment) | matrixWithAssessment <= 1))
  expect_equal(sum(is.na(matrixWithAssessment)), nrow(matrixWithAssessment))
})