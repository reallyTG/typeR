test_that("AE.CI", {
  expect_equal(AE.CI(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$lower, 0.275)
  expect_equal(AE.CI(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$upper, 0.8)
  expect_equal(AE.CI(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$lower, 0.225)
  expect_equal(AE.CI(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$upper, 0.775)
})

test_that("Robins.CI", {
  expect_equal(Robins.CI(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$lower,
               0.496854, tolerance=1e-6)
  expect_equal(Robins.CI(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$upper,
               0.8364794, tolerance=1e-6)
  expect_equal(Robins.CI(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$lower,
               0.305254, tolerance=1e-6)
  expect_equal(Robins.CI(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$upper,
               0.7899841, tolerance=1e-6)
})

test_that("Perm.CI.RLH", {
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$Chiba[1],
               0.400)
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$Chiba[2],
               0.775)
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$RLH[1],
               0.375)
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$RLH[2],
               0.775)
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$Blaker[1],
               0.400)
  expect_equal(Perm.CI.RLH(matrix(c(11,1,7,21),2,2,byrow=TRUE),0.05)$Blaker[2],
               0.775)
})

test_that("Perm.CI.RLH", {
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$Chiba[1],
               0.250)
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$Chiba[2],
               0.775)
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$RLH[1],
               0.25)
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$RLH[2],
               0.75)
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$Blaker[1],
               0.275)
  expect_equal(Perm.CI.RLH(matrix(c(7,5,1,27),2,2,byrow=TRUE),0.05)$Blaker[2],
               0.750)
})