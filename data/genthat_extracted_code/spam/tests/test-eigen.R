# HEADER ####################################################
# This is file spam/tests/testthat/test-eigen.R.            #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################

rm(list = ls())
source("helper.R")

context("test-eigen.R")
options(spam.force64 = FALSE)

nEV <- 50
prec2020 <- precmat.GMRFreglat(20,20)
dn_gmrf    <- spam::precmat.GMRFreglat(20, 20, c(.4,.3,.2,.1),'m2p4')
dn_gmrf[1:10, 1] <- 100

test_that("check format of return", {
  spameigen <- eigen.spam(prec2020, nev = nEV, control = list(spamflag = TRUE, mode = 'LM'), only.values = FALSE)
  nsys_spameigen <- eigen.spam(dn_gmrf, nev = nEV, control = list(spamflag = TRUE, mode = 'LM'), only.values = FALSE)

  expect_identical(class(spameigen),              "list")
  expect_identical(class(spameigen$values),       "numeric")
  expect_identical(class(spameigen$vectors),      "matrix")
  expect_identical(class(nsys_spameigen),         "list")
  expect_identical(class(nsys_spameigen$values),  "complex")
  expect_identical(class(nsys_spameigen$vectors), "matrix")
})

test_that("eigenvalues", {
  baseeigen <- eigen(prec2020, only.values = TRUE)
  spameigenL <- eigen.spam(prec2020, nev = nEV, control = list(spamflag = T, mode = 'LM'), only.values = TRUE)
  spameigenS <- eigen.spam(prec2020, nev = nEV, control = list(spamflag = T, mode = 'SM'), only.values = TRUE)
  spamtest_eq(head(baseeigen$values, nEV), head(spameigenL$values, nEV), relative = FALSE)
  spamtest_eq(tail(baseeigen$values, nEV), tail(spameigenS$values, nEV), relative = FALSE)

  nsys_baseeigen <- eigen(dn_gmrf, only.values = TRUE)
  nsys_spameigenL <- eigen.spam(dn_gmrf, nev = nEV, control = list(spamflag = T, mode = 'LR', ncv = 400), only.values = TRUE, symmetric = FALSE)
  nsys_spameigenS <- eigen.spam(dn_gmrf, nev = nEV, control = list(spamflag = T, mode = 'SR'), only.values = TRUE)
  # spamtest_eq(head(nsys_baseeigen$values, nEV), head(nsys_spameigenL$values, nEV), relative = FALSE)
  # spamtest_eq(tail(nsys_baseeigen$values, nEV), tail(nsys_spameigenS$values, nEV), relative = TRUE)
})

test_that("eigenvectors", {
  baseeigen <- eigen(prec2020, only.values = FALSE)
  spameigenL <- eigen.spam(prec2020, nev = nEV, control = list(spamflag = T, mode = 'LM'), only.values = FALSE)
  spameigenS <- eigen.spam(prec2020, nev = nEV, control = list(spamflag = T, mode = 'SM'), only.values = FALSE)

  for (i in 1:nEV) {spamtest_eq(sqrt(sum(spameigenL$vectors[, i]^2)), 1) }
  for (i in 1:nEV) {spamtest_eq(sqrt(sum(spameigenS$vectors[, i]^2)), 1) }
  for (i in 1:nEV) {spamtest_eq(as.matrix(prec2020)%*%spameigenL$vectors[, i], spameigenL$vectors[, i]*spameigenL$values[i]) }
})

