context("syntax_checks")

# general checks 
#======================================
test_that("Test 1.1.1", {
  errormessage <- 'argument "type" is missing, with no default'
  expect_error(pmsampsize(rsquared=0.2,parameters=25,intercept=1.9,sd=0.6), errormessage)
})

test_that("Test 1.1.2", {
  errormessage <- 'argument "rsquared" is missing, with no default'
  expect_error(pmsampsize(type="c",parameters=25,intercept=1.9,sd=0.6), errormessage)
})

test_that("Test 1.1.3", {
  errormessage <- 'argument "parameters" is missing, with no default'
  expect_error(pmsampsize(type="c",rsquared=0.2,intercept=1.9,sd=0.6), errormessage)
})


# checks for continuous sample size 
#======================================
test_that("Test 1.2.1", {
  errormessage <- "sd must be specified for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9), errormessage)
})

test_that("Test 1.2.2", {
  errormessage <- "intercept must be specified for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,sd=0.6), errormessage)
})

test_that("Test 1.2.3", {
  errormessage <- "parameters must be an integer"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25.5,intercept=1.9,sd=0.6), errormessage)
})

test_that("Test 1.2.4", {
  errormessage <- "parameters must be an integer"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters="10",intercept=1.9,sd=0.6), errormessage)
})

test_that("Test 1.2.5", {
  errormessage <- "sd must be numeric"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd="0.6"), errormessage)
})

test_that("Test 1.2.6", {
  errormessage <- "intercept must be numeric"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept="1.9",sd=0.6), errormessage)
})

test_that("Test 1.2.7", {
  errormessage <- "prevalence not required for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=0.6, prevalence=0.5), errormessage)
})

test_that("Test 1.2.8", {
  errormessage <- "rate not required for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=0.6, rate=0.5), errormessage)
})

test_that("Test 1.2.9", {
  errormessage <- "timepoint not required for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=0.6, timepoint=2), errormessage)
})

test_that("Test 1.2.10", {
  errormessage <- "meanfup not required for continuous sample size"
  expect_error(pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=0.6, meanfup=2.07), errormessage)
})


# checks for binary sample size 
#======================================
test_that("Test 1.3.1", {
  errormessage <- "prevalence must be specified for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24), errormessage)
})

test_that("Test 1.3.2", {
  errormessage <- "prevalence must be numeric"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = "0.174"), errormessage)
})

test_that("Test 1.3.3", {
  errormessage <- "intercept not required for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174, intercept=1.9), errormessage)
})

test_that("Test 1.3.4", {
  errormessage <- "sd not required for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174, sd=0.6), errormessage)
})

test_that("Test 1.3.5", {
  errormessage <- "rate not required for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174, rate=0.6), errormessage)
})

test_that("Test 1.3.6", {
  errormessage <- "timepoint not required for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174, timepoint=2), errormessage)
})

test_that("Test 1.3.7", {
  errormessage <- "meanfup not required for binary sample size"
  expect_error(pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174, meanfup=2.07), errormessage)
})


# checks for survival sample size 
#======================================
test_that("Test 1.4.1", {
  errormessage <- "rate must be specified for survival sample size"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, timepoint=2, meanfup=2.07), errormessage)
})

test_that("Test 1.4.2", {
  errormessage <- "timepoint must be specified for survival sample size"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, meanfup=2.07), errormessage)
})

test_that("Test 1.4.3", {
  errormessage <- "meanfup must be specified for survival sample size"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, timepoint=2), errormessage)
})

test_that("Test 1.4.4", {
  errormessage <- "rate must be numeric"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate="0.065", timepoint=2, meanfup=2.07), errormessage)
})

test_that("Test 1.4.4", {
  errormessage <- "timepoint must be numeric"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, timepoint="2", meanfup=2.07), errormessage)
})

test_that("Test 1.4.4", {
  errormessage <- "meanfup must be numeric"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, timepoint=2, meanfup="2.07"), errormessage)
})

test_that("Test 1.4.5", {
  errormessage <- "the specified overall event rate must be greater than 0"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=-0.065, timepoint=2, meanfup=2.07), errormessage)
})

test_that("Test 1.4.6", {
  errormessage <- "the timepoint of interest for prediction must be greater than 0"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, timepoint=-2, meanfup=2.07), errormessage)
})

test_that("Test 1.4.7", {
  errormessage <- "the average mean follow-up time must be greater than 0"
  expect_error(pmsampsize(type="s", rsquared= 0.051, parameters=25, rate=0.065, timepoint=2, meanfup=-2.07), errormessage)
})





