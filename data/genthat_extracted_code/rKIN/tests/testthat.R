library(testthat)
library(rKIN)

#test_check("rKIN")

#Create some datasets useful for testing
#Test for data.frame
datM<- as.matrix(data.frame(Species = c(rep("Spec1", times = 2), rep("Spec2", times = 10)),
                  C13 = c(runif(2, min = -30, max = -20), runif(10, min = -30, max = -20)),
                  N15 = c(runif(2, min = -3, max = 8), runif(10, min = -3, max = 8))))
#Too few rows for Spec1
dat0<- data.frame(Species = c(rep("Spec1", times = 2), rep("Spec2", times = 10)),
                  C13 = c(runif(2, min = -30, max = -20), runif(10, min = -30, max = -20)),
                  N15 = c(runif(2, min = -3, max = 8), runif(10, min = -3, max = 8)))
#Minimum with small samp = TRUE
#Too few rows for Spec1
dat1<- data.frame(Species = c(rep("Spec1", times = 3), rep("Spec2", times = 3)),
                  C13 = c(runif(3, min = -30, max = -20), runif(3, min = -30, max = -20)),
                  N15 = c(runif(3, min = -3, max = 8), runif(3, min = -3, max = 8)))
#Minimum with small samp = FALSE, default behavior
dat2<- data.frame(Species = c(rep("Spec1", times = 10), rep("Spec2", times = 10)),
                  C13 = c(runif(10, min = -30, max = -20), runif(10, min = -30, max = -20)),
                  N15 = c(runif(10, min = -3, max = 8), runif(10, min = -3, max = 8)))


context("Check MCP Estimator")

test_that("estMCP input data check", {
  expect_error(estMCP(data = datM, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "MCP data.frame check")
  expect_error(estMCP(data = dat0, x = "C1", y = "N15", group = "Species", smallSamp = FALSE), info = "MCP x column exists check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N1", group = "Species", smallSamp = FALSE), info = "MCP y column exists check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N15", group = "Spec", smallSamp = FALSE), info = "MCP group column exists check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "95"), smallSamp = FALSE), info = "MCP levels numeric check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "105"), smallSamp = FALSE), info = "MCP levels numeric check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "MCP Number of Rows Check")
  expect_error(estMCP(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = TRUE), info = "MCP Number of Rows Check")
  expect_error(estMCP(data = dat1, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "MCP Number of Rows Check")
  expect_output(estMCP(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), regexp = NA, info = "MCP Should be successful")
})

context("Check Ellipse Estimator")

test_that("estEllipse input data check", {
  expect_error(estEllipse(data = datM, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "Ellipse data.frame check")
  expect_error(estEllipse(data = dat0, x = "C1", y = "N15", group = "Species", smallSamp = FALSE), info = "Ellipse x column exists check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N1", group = "Species", smallSamp = FALSE), info = "Ellipse y column exists check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N15", group = "Spec", smallSamp = FALSE), info = "Ellipse group column exists check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "95"), smallSamp = FALSE), info = "Ellipse levels numeric check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "105"), smallSamp = FALSE), info = "Ellipse levels numeric check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "Ellipse Number of Rows Check")
  expect_error(estEllipse(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = TRUE), info = "Ellipse Number of Rows Check")
  expect_error(estEllipse(data = dat1, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "Ellipse Number of Rows Check")
  expect_output(estEllipse(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), regexp = NA, info = "Ellipse Should be successful")
})

context("Check Kernel Estimator")

test_that("estKIN input data check", {
  expect_error(estKIN(data = datM, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "KIN data.frame check")
  expect_error(estKIN(data = dat0, x = "C1", y = "N15", group = "Species", smallSamp = FALSE), info = "KIN x column exists check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N1", group = "Species", smallSamp = FALSE), info = "KIN y column exists check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N15", group = "Spec", smallSamp = FALSE), info = "KIN group column exists check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "95"), smallSamp = FALSE), info = "KIN levels numeric check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N15", group = "Species", levels= c("50", "75", "105"), smallSamp = FALSE), info = "KIN levels numeric check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "KIN Number of Rows Check")
  expect_error(estKIN(data = dat0, x = "C13", y = "N15", group = "Species", smallSamp = TRUE), info = "KIN Number of Rows Check")
  expect_error(estKIN(data = dat1, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), info = "KIN Number of Rows Check")
  expect_output(estKIN(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE), regexp = NA, info = "KIN Should be successful")
  expect_output(estKIN(data = dat1, x = "C13", y = "N15", group = "Species", smallSamp = TRUE, scaler = 10), regexp = NA, info = "KIN Should be successful")
})

#Create output to test the functions for area and plotting
testMCP<- estMCP(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE)
testElp<- estEllipse(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE)
testKin<- estKIN(data = dat2, x = "C13", y = "N15", group = "Species", smallSamp = FALSE, scaler = 4)

context("Check getArea")

test_that("getArea data check", {
  expect_error(getArea(datm), info = "estObj data check")
  expect_output(getArea(testMCP), regexp = NA, info = "estObj data check, should succeed")
  expect_output(getArea(testElp), regexp = NA, info = "estObj data check, should succeed")
  expect_output(getArea(testKin), regexp = NA, info = "estObj data check, should succeed")
})

context("Check calcOverlap")

test_that("calcOverlap data check", {
  expect_error(calcOverlap(datm), info = "estObj data check")
  expect_output(calcOverlap(testMCP), regexp = NA, info = "estObj data check, should succeed")
  expect_output(calcOverlap(testElp), regexp = NA, info = "estObj data check, should succeed")
  expect_output(calcOverlap(testKin), regexp = NA, info = "estObj data check, should succeed")
})

context("Check plotKIN")

test_that("plotKIN data check", {
  expect_error(plotKIN(datm), info = "estObj data check")
  expect_error(plotKIN(testMCP, scaler = "1", title = "MCP Estimates",
               xlab = expression({delta}^13*C~ ('\u2030')),
               ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = "0.3", title = "MCP Estimates",
                        xlab = expression({delta}^13*C~ ('\u2030')),
                        ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = 1.1, title = "MCP Estimates",
                       xlab = expression({delta}^13*C~ ('\u2030')),
                       ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = 0.3, title = 1,
                       xlab = expression({delta}^13*C~ ('\u2030')),
                       ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = 1.1, title = "MCP Estimates",
                       xlab = expression({delta}^13*C~ ('\u2030')),
                       ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = 0.3, title = "MCP Estimates",
                       xlab = 1,
                       ylab = expression({delta}^15*N~ ('\u2030'))))
  expect_error(plotKIN(testMCP, scaler = 1, alpha = 0.3, title = "MCP Estimates",
                       xlab = expression({delta}^13*C~ ('\u2030')),
                       ylab = 1))
  expect_output(plotKIN(testMCP, scaler = 2, alpha = 0.3, title = "MCP Estimates",
                        xlab = expression({delta}^13*C~ ('\u2030')),
                        ylab = expression({delta}^15*N~ ('\u2030'))), regexp = NA, info = "plotKIN, should succeed")
  expect_output(plotKIN(testElp, scaler = 2, alpha = 0.3, title = "Ellipse Estimates",
                        xlab = expression({delta}^13*C~ ('\u2030')),
                        ylab = expression({delta}^15*N~ ('\u2030'))), regexp = NA, info = "plotKIN, should succeed")
  expect_output(plotKIN(testKin, scaler = 2, alpha = 0.3, title = "Kernel Estimates",
                        xlab = expression({delta}^13*C~ ('\u2030')),
                        ylab = expression({delta}^15*N~ ('\u2030'))), regexp = NA, info = "plotKIN, should succeed")
})
