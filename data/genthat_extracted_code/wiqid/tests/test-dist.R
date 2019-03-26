
# test_that code for dist series of functions

# library(testthat)
# library(wiqid)
# test_file(file.choose())

# distBrayCurtis,
  # distChaoJaccCorr, distChaoJaccNaive, distChaoSorCorr, distChaoSorNaive,
  # distChord, distJaccard, distMatching, distMorisitaHorn, distOchiai, distPreston,
  # distRogersTanimoto, distSimRatio, distSorensen, distWhittaker


context("Distance measures")
# ==========================

test_that("check against test data",  {
  data(distTestData)
  expect_that(round(as.vector(distShell(distTestData, distBrayCurtis)), 3),
    equals(c(0.835, 1.000, 0.333, 0.333, 1.000, 0.840, 0.890, 1.000, 0.333, 0.500)))
  expect_that(round(as.vector(distShell(distTestData, distChord)), 3),
    equals(c(1.334, 1.414, 0.000, 0.765, 1.414, 1.334, 1.358, 1.414, 0.765, 0.765)))
  expect_that(as.vector(distShell(distTestData, distJaccard)),
    equals(c(0.0, 1.0, 0.0, 0.5, 1.0, 0.0, 0.5, 1.0, 0.5, 0.5)))
  expect_that(as.vector(distShell(distTestData, distMatching)),
    equals(c(0.0, 1.0, 0.0, 0.5, 1.0, 0.0, 0.5, 1.0, 0.5, 0.5)))
  expect_that(round(as.vector(distShell(distTestData, distMorisitaHorn)), 3),
    equals(c(0.890, 1.000, 0.000, 0.333, 1.000, 0.890, 0.927, 1.000, 0.333, 0.333)))
  expect_that(round(as.vector(distShell(distTestData, distOchiai)), 3),
    equals(c(0.000, 1.000, 0.000, 0.293, 1.000, 0.000, 0.293, 1.000, 0.293, 0.293)))
  expect_that(round(as.vector(distShell(distTestData, distPreston)), 3),
    equals(c(0.500, 1.000, 0.500, 0.041, 1.000, 0.500, 0.041, 1.000, 0.041, 0.041)))
  expect_that(round(as.vector(distShell(distTestData, distRogersTanimoto)), 3),
    equals(c(0.000, 1.000, 0.000, 0.667, 1.000, 0.000, 0.667, 1.000, 0.667, 0.667)))
  expect_that(round(as.vector(distShell(distTestData, distSimRatio)), 3),
    equals(c(0.942, 1.000, 0.333, 0.500, 1.000, 0.954, 0.962, 1.000, 0.500, 0.500)))
  expect_that(round(as.vector(distShell(distTestData, distSorensen)), 3),
    equals(c(0.000, 1.000, 0.000, 0.333, 1.000, 0.000, 0.333, 1.000, 0.333, 0.333)))
  expect_that(round(as.vector(distShell(distTestData, distWhittaker)), 3),
    equals(c(0.835, 1.000, 0.000, 0.500, 1.000, 0.835, 0.880, 1.000, 0.500, 0.500)))
} )

test_that("check against KillarneyBirds",  {
  data(KillarneyBirds)
  kb <- t(KillarneyBirds[, c(1,2,4,8,9)])
  expect_that(round(as.vector(distShell(kb, distBrayCurtis)), 3),
    equals(c(0.170, 0.343, 0.336, 0.363, 0.397, 0.409, 0.433, 0.310, 0.286, 0.251)))
  expect_that(round(as.vector(distShell(kb, distChaoJaccCorr)), 3),
    equals(c(0.017, 0.104, 0.117, 0.082, 0.178, 0.070, 0.169, 0.189, 0.113, 0.084)))
  expect_that(round(as.vector(distShell(kb, distChaoJaccNaive)), 3),
    equals(c(0.049, 0.109, 0.133, 0.105, 0.182, 0.149, 0.171, 0.195, 0.113, 0.109)))
  expect_that(round(as.vector(distShell(kb, distChaoSorCorr)), 3),
    equals(c(0.008, 0.055, 0.062, 0.043, 0.098, 0.036, 0.092, 0.104, 0.060, 0.044)))
  expect_that(round(as.vector(distShell(kb, distChaoSorNaive)), 3),
    equals(c(0.025, 0.058, 0.071, 0.056, 0.100, 0.080, 0.094, 0.108, 0.060, 0.058)))
  expect_that(round(as.vector(distShell(kb, distChord)), 3),
    equals(c(0.263, 0.578, 0.516, 0.463, 0.572, 0.568, 0.443, 0.510, 0.511, 0.475)))
  expect_that(round(as.vector(distShell(kb, distJaccard)), 3),
    equals(c(0.250, 0.409, 0.360, 0.348, 0.520, 0.407, 0.519, 0.500, 0.429, 0.304)))
  expect_that(round(as.vector(distShell(kb, distMatching)), 3),
    equals(c(0.194, 0.290, 0.290, 0.258, 0.419, 0.355, 0.452, 0.387, 0.290, 0.226)))
  expect_that(round(as.vector(distShell(kb, distMorisitaHorn)), 3),
    equals(c(0.035, 0.167, 0.142, 0.109, 0.165, 0.176, 0.104, 0.138, 0.132, 0.115)))
  expect_that(round(as.vector(distShell(kb, distOchiai)), 3),
    equals(c(0.142, 0.249, 0.219, 0.209, 0.339, 0.256, 0.347, 0.324, 0.270, 0.177)))
  expect_that(round(as.vector(distShell(kb, distPreston)), 3),
    equals(c(0.186, 0.297, 0.285, 0.270, 0.396, 0.328, 0.423, 0.384, 0.336, 0.224)))
  expect_that(round(as.vector(distShell(kb, distRogersTanimoto)), 3),
    equals(c(0.324, 0.450, 0.450, 0.410, 0.591, 0.524, 0.622, 0.558, 0.450, 0.368)))
  expect_that(round(as.vector(distShell(kb, distSimRatio)), 3),
    equals(c(0.078, 0.392, 0.377, 0.395, 0.437, 0.459, 0.445, 0.232, 0.246, 0.209)))
  expect_that(round(as.vector(distShell(kb, distSorensen)), 3),
    equals(c(0.143, 0.257, 0.220, 0.211, 0.351, 0.256, 0.350, 0.333, 0.273, 0.179)))
  expect_that(round(as.vector(distShell(kb, distWhittaker)), 3),
    equals(c(0.163, 0.325, 0.300, 0.261, 0.310, 0.348, 0.284, 0.313, 0.295, 0.244)))
} )

