skip_on_cran()
require(testthat)
require(EdSurvey)
options(width = 500)
options(useFancyQuotes=FALSE)
#source("REF-5-piaac.R") # has REF output in it

context("PIAAC data reads in correctly")
if(!exists("edsurveyHome")) {
  if (Sys.info()[['sysname']] == "Windows") {
    edsurveyHome <- "C:/EdSurveyData/"
  } else {
    edsurveyHome <- "~/EdSurveyData/"
  }
}

if (!dir.exists(edsurveyHome)) {
  dir.create(edsurveyHome)
}

test_that("PIAAC data reads in correctly", {
  expect_silent(downloadPIAAC(root=edsurveyHome, round = 1, verbose = FALSE))
  expect_error(usa <<- readPIAAC(file.path(edsurveyHome, "PIAAC", "Round 1"), countries = c("usa"), verbose=FALSE), NA)
  expect_error(nor <<- readPIAAC(file.path(edsurveyHome, "PIAAC", "Round 1"), countries = c("nor"), verbose=FALSE), NA)
  expect_error(deu <<- readPIAAC(file.path(edsurveyHome, "PIAAC", "Round 1"), countries = c("deu"), verbose=FALSE), NA)
})

context("PIAAC data Wald test examples")
test_that("Wald test works correctly for PIAAC data", {
  
  myLogit <- logit.sdf(lit ~ i_q04j + j_q02a, data = usa)
  wt <- waldTest(model = myLogit, coefficients = "i_q04j", H0 = 1)
  wt5 <- capture.output(wt)
  expect_equal(wt5, wt5REF)
  
  myLogit <- logit.sdf(lit ~ i_q04j + j_q02a, data = nor)
  wt <- waldTest(model = myLogit, coefficients = "i_q04j", H0 = 1)
  wt6 <- capture.output(wt)
  expect_equal(wt6, wt6REF)
  
  myLogit <- logit.sdf(lit ~ i_q04j + j_q02a, data = deu)
  wt <- waldTest(model = myLogit, coefficients = "i_q04j", H0 = 1)
  wt7 <- capture.output(wt)
  expect_equal(wt7, wt7REF)
})


