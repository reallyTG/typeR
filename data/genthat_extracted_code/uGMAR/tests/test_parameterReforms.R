library(uGMAR)
context("parameter reforms")

params11 <- c(1, 0.9, 1, 10) # StMAR
params12 <- c(0.8, 0.5, 0.5, 2, -1, 0.1, 0.6)
params12_2 <- c(2, -1, 0.1, 0.8, 0.5, 0.5, 0.4, 12, 30) #StMAR
params22 <- c(0.2, 0.1, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.49)
params13 <- c(0.1, 0.99, 0.1, 0.2, -0.99, 0.2, 0.3, 0.01, 0.3, 0.5, 0.5)
params23 <- c(0.1, 0.1, 0.1, 0.1, 0.2, 0.5, 0.5, 0.2, 0.3, 0.3, 0.3, 0.3, 0.8, 0.05, 11, 12, 13) # StMAR
params23_2 <- c(0.1, 0.1, 0.1, 0.1, 0.2, 0.5, 0.5, 0.2, 0.3, 0.3, 0.3, 0.3, 0.3, 0.05, 11, 12, 13) # StMAR

params12r <- c(0.1, 0.1, 1, 0.1, 0.1, 0.6, 11, 12) # StMAR
params22r <- c(0.1, 0.2, 0.99, 0.01, 0.1, 0.2, 0.05)
params23r <- c(0.1, 0.3, 0.4, -0.4, 0.3, 1, 2, 3, 0.5, 0.1, 100, 112, 130) # StMAR
params13r <- c(1, 2, 3, 0.99999, 1, 2, 3, 0.2, 0.15)
params23r2 <- c(0.1, 0.2, 0.3, 0.9, 0.2, 0.1, 0.2, 0.3, 0.3, 0.5)

params13gs <- c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 3, 0.4, 0.2, 10, 20) # M1=1, M2=2
params23gs <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 2, 3, 0.3, 0.3, 3, 0.2, 0.3, 10) # M1=2, M2=1
params14gs <- c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 3, 4, 0.4, 4, 0.4, 0.3, 0.2, 11, 12) # M1=2, M2=2
params22gsr <- c(1, 2, 0.1, 0.2, 1, 2, 0.1, 10) # M1=1, M2=1
params13gsr <- c(1, 2, 3, 0.5, 1, 2, 3, 0.1, 0.1, 11, 12) # M1=1, M2=2
params14gsr <- c(1, 2, 3, 4, 0.5, 1, 2, 3, 4, 0.1, 0.2, 0.3, 10) # M1=3, M2=1

rf12 <- reformRestrictedPars(p=1, M=2, params=params12r, model="StMAR", restricted=TRUE)
rf22 <- reformRestrictedPars(p=2, M=2, params=params22r, model="GMAR", restricted=TRUE)
rf23 <- reformRestrictedPars(p=2, M=3, params=params23r, model="StMAR", restricted=TRUE)
rf13 <- reformRestrictedPars(p=1, M=3, params=params13r, model="GMAR", restricted=TRUE)
rf22gsr <- reformRestrictedPars(p=2, M=c(1, 1), params=params22gsr, model="G-StMAR", restricted=TRUE)
rf13gsr <- reformRestrictedPars(p=1, M=c(1, 2), params=params13gsr, model="G-StMAR", restricted=TRUE)
rf14gsr <- reformRestrictedPars(p=1, M=c(3, 1), params=params14gsr, model="G-StMAR", restricted=TRUE)


test_that("reformRestrictedPars works correctly", {
  expect_equal(reformRestrictedPars(p=2, M=3, params=params23, model="StMAR", restricted=FALSE), params23)
  expect_equal(rf12, c(0.1, 1, 0.1, 0.1, 1, 0.1, 0.6, 11, 12))
  expect_equal(rf22, c(0.1, 0.99, 0.01, 0.1, 0.2, 0.99, 0.01, 0.2, 0.05))
  expect_equal(rf23, c(0.1, -0.4, 0.3, 1, 0.3, -0.4, 0.3, 2, 0.4, -0.4, 0.3, 3, 0.5, 0.1, 100, 112, 130))
  expect_equal(rf13, c(1, 0.99999, 1, 2, 0.99999, 2, 3, 0.99999, 3, 0.2, 0.15))
  expect_equal(rf22gsr, c(1, 0.1, 0.2, 1, 2, 0.1, 0.2, 2, 0.1, 10))
  expect_equal(rf13gsr, c(1, 0.5, 1, 2, 0.5, 2, 3, 0.5, 3, 0.1, 0.1, 11, 12))
  expect_equal(rf14gsr, c(1, 0.5, 1, 2, 0.5, 2, 3, 0.5, 3, 4, 0.5, 4, 0.1, 0.2, 0.3, 10))
})


ref23gs <- reformParameters(2, c(2, 1), params=params23gs, model="G-StMAR")
ref14gs <- reformParameters(1, c(2, 2), params=params14gs, model="G-StMAR")
ref22gsr <- reformParameters(2, c(1, 1), params=params22gsr, model="G-StMAR", restricted=TRUE)
ref13gsr <- reformParameters(1, c(1, 2), params=params13gsr, model="G-StMAR", restricted=TRUE)

ref11 <- reformParameters(1, 1, params=params11, model="StMAR")
ref12 <- reformParameters(1, 2, params=params12)
ref12_2 <- reformParameters(1, 2, params=params12_2, model="StMAR")
ref13 <- reformParameters(1, 3, params=params13)
ref23 <- reformParameters(2, 3, params=params23, model="StMAR")

ref12r <- reformParameters(1, 2, params=params12r, model="StMAR", restricted=TRUE)
ref23r <- reformParameters(2, 3, params=params23r, model="StMAR", restricted=TRUE)
ref13r <- reformParameters(1, 3, params=params13r, restricted=TRUE)

test_that("reformParameters works correctly", {
  expect_equal(ref11$pars[2, 1], 0.9)
  expect_equal(ref11$alphas, 1)
  expect_equal(ref11$dfs[1], 10)
  expect_equal(ref12$pars[3, 2], 0.1)
  expect_equal(ref12$alphas[2], 0.4)
  expect_equal(ref12_2$pars[1, 1], 2)
  expect_equal(ref12_2$alphas[2], 0.6)
  expect_equal(ref13$pars[2, 3], 0.01)
  expect_equal(ref13$alphas[1], 0.5)
  expect_equal(ref23$pars[2, 2], 0.5)
  expect_equal(ref23$pars[3, 3], 0.3)
  expect_equal(ref23$dfs[3], 13)

  expect_equal(ref12r$params[5], 1)
  expect_equal(ref12r$pars[3, 1], 0.1)
  expect_equal(ref12r$dfs[2], 12)
  expect_equal(ref23r$params[4], 1)
  expect_equal(ref23r$pars[3, 3], 0.3)
  expect_equal(ref23r$alphas[3], 0.4)
  expect_equal(ref23r$dfs[3], 130)
  expect_equal(ref13r$params[3], 1)
  expect_equal(ref13r$params[8], 0.99999)
  expect_equal(ref13r$pars[2, 3], 0.99999)
  expect_equal(ref13r$pars[1, 3], 3)
  expect_equal(ref13r$pars[1, 2], 2)
  expect_equal(ref13r$alphas[1], 0.2)
  expect_equal(ref13r$alphas[3], 0.65)

  expect_equal(ref23gs$alphas[3], 0.5)
  expect_equal(ref23gs$dfs, 10)
  expect_equal(ref23gs$pars[2,2], 0.2)
  expect_equal(ref14gs$pars[3,4], 4)
  expect_equal(ref14gs$alphas[4], 0.1)
  expect_equal(ref22gsr$params[7], 0.2)
  expect_equal(ref22gsr$alphas[2], 0.9)
  expect_equal(ref13gsr$params[8], 0.5)
  expect_equal(ref13gsr$pars[3,3], 3)
  expect_equal(ref13gsr$dfs, c(11, 12))
})


R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R2 <- diag(1, ncol=3, nrow=3)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)

params32c <- c(1, 0.1, -0.1, 1, 2, 0.2, -0.2, 2, 0.6, 11, 12)
refc32c <- reformConstrainedPars(3, 2, params=params32c, model="StMAR", constraints=list(R1, R1))

params33c <- c(1, 0.1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 3, 0.3, -0.3, 3, 0.5, 0.4)
refc33c <- reformConstrainedPars(3, 3, params=params33c, constraints=list(R2, R2, R1))

params21c <- c(1, 1, 1, 3)
refc21c <- reformConstrainedPars(2, 1, params=params21c, model="StMAR", constraints=list(R3))

params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12)
refc22c <- reformConstrainedPars(2, 2, params=params22c, model="StMAR", constraints=list(R4, R3))

params21cr <- c(1, 1, 1)
refc21cr <- reformConstrainedPars(2, 1, params=params21cr, restricted=TRUE, constraints=R3)

params22cr <- c(1, 2, 0.8, 1, 2, 0.7, 11, 12)
refc22cr <- reformConstrainedPars(2, 2, params=params22cr, model="StMAR", restricted=TRUE, constraints=R3)

params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6)
refc32cr <- reformConstrainedPars(3, 2, params=params32cr, restricted=TRUE, constraints=R1)

params32gsc <- c(1, 0.1, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 0.6, 10) # M1=1, M2=1, R1, R2
refc32gsc <- reformConstrainedPars(3, c(1, 1), params=params32gsc, model="G-StMAR", constraints=list(R1, R2))

params23gsc <- c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 0.3, 3, 0.3, 0.4, 20, 30) # M1=1, M2=2, R3, R3, R4
refc23gsc <- reformConstrainedPars(2, c(1, 2), params=params23gsc, model="G-StMAR", constraints=list(R3, R3, R4))

params22gsrc <- c(1, 2, 0.5, 1, 2, 0.5, 10) # M1=1, M2=1, R3
refc22gsrc <- reformConstrainedPars(2, c(1, 1), params=params22gsrc, model="G-StMAR", restricted=TRUE, constraints=R3)

all22gs <- reformRestrictedPars(p=2, M=c(1, 1), params=refc22gsrc, model="G-StMAR", restricted=TRUE)


test_that("removeAllConstraints works correctly", {
  expect_equal(removeAllConstraints(p=2, M=3, params=params23, model="StMAR", restricted=FALSE), params23)
  expect_equal(removeAllConstraints(p=3, M=3, params=params33c, model="GMAR", restricted=FALSE, constraints=list(R2, R2, R1)), refc33c)
  expect_equal(removeAllConstraints(p=2, M=c(1, 1), params=params22gsrc, model="G-StMAR", restricted=TRUE, constraints=R3), all22gs)
})


test_that("reformConstrainedPars works correctly", {
  expect_equal(refc32c, c(1.0, 0.1, 0.0, -0.1, 1.0, 2.0, 0.2, 0.0, -0.2, 2.0, 0.6, 11.0, 12.0))
  expect_equal(refc33c, c(1.0, 0.1, 0.1, 0.1, 1.0, 2.0, 0.2, 0.2, 0.2, 2.0, 3.0, 0.3, 0.0, -0.3, 3.0, 0.5, 0.4))
  expect_equal(refc21c, c(1.0, 0.5, 0.5, 1.0, 3.0))
  expect_equal(refc22c, c(1.0, 0.1, -0.1, 1.0, 2.0, 0.1, 0.1, 2.0, 0.8, 11.0, 12.0))

  expect_equal(refc21cr, c(1.0, 0.5, 0.5, 1.0))
  expect_equal(refc22cr, c(1.0, 2.0, 0.4, 0.4, 1.0, 2.0, 0.7, 11.0, 12.0))
  expect_equal(refc32cr, c(1.0, 2.0, 0.3, 0.0, -0.3, 1.0, 2.0, 0.6))

  expect_equal(refc32gsc, c(1, 0.1, 0, 0.1, 1, 2, 0.2, 0.2, 0.2, 2, 0.6, 10))
  expect_equal(refc23gsc, c(1, 0.05, 0.05, 1, 2, 0.1, 0.1, 2, 3, 0.3, 0.3, 3, 0.3, 0.4, 20, 30) )
  expect_equal(refc22gsrc, c(1, 2, 0.25, 0.25, 1, 2, 0.5, 10))
})

test_that("sortComponents sorts correctly", {
 expect_equal(sortComponents(1, c(1, 2), params=params13gs, model="G-StMAR"), c(1, 0.1, 1, 3, 0.3, 3, 2, 0.2, 2, 0.4, 0.4, 20, 10))
 expect_equal(sortComponents(2, c(2, 1), params=params23gs, model="G-StMAR"), c(2, 0.2, 0.2, 2, 1, 0.1, 0.1, 1, 3, 0.3, 0.3, 3, 0.3, 0.2, 10))
 expect_equal(sortComponents(1, c(2, 2), params=params14gs, model="G-StMAR"), params14gs)
 expect_equal(sortComponents(2, c(1, 1), params=params22gsr, model="G-StMAR", restricted=TRUE), params22gsr)
 expect_equal(sortComponents(1, c(1, 2), params=params13gsr, model="G-StMAR", restricted=TRUE), c(1, 3, 2, 0.5, 1, 3, 2, 0.1, 0.8, 12, 11))
 expect_equal(sortComponents(1, c(3, 1), params=params14gsr, model="G-StMAR", restricted=TRUE), c(3, 2, 1, 4, 0.5, 3, 2, 1, 4, 0.3, 0.2, 0.1, 10))

 expect_equal(sortComponents(1, 1, params11, model="StMAR"), params11)
 expect_equal(sortComponents(1, 2, params12), params12)
 expect_equal(sortComponents(1, 2, params12_2, model="StMAR"), c(0.8, 0.5, 0.5, 2, -1, 0.1, 0.6, 30, 12))
 expect_equal(sortComponents(2, 2, params22), c(0.2, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.51))
 expect_equal(sortComponents(1, 3, params13), params13)
 expect_equal(sortComponents(2, 3, params23, model="StMAR"), c(0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3, 0.3, 0.2, 0.5, 0.5, 0.2, 0.8, 0.15, 11, 13, 12))
 expect_equal(sortComponents(2, 3, params23_2, model="StMAR"), c(0.3, 0.3, 0.3, 0.3, 0.1, 0.1, 0.1, 0.1, 0.2, 0.5, 0.5, 0.2, 0.65, 0.3, 13, 11, 12))

 expect_equal(sortComponents(1, 2, params12r, restricted=TRUE, model="StMAR"), params12r)
 expect_equal(sortComponents(2, 2, params22r, restricted=TRUE), c(0.2, 0.1, 0.99, 0.01, 0.2, 0.1, 0.95))
 expect_equal(sortComponents(2, 3, params23r, restricted=TRUE, model="StMAR"), c(0.1, 0.4, 0.3, -0.4, 0.3, 1, 3, 2, 0.5, 0.4, 100, 130, 112))
 expect_equal(sortComponents(1, 3, params13r, restricted=TRUE), c(3, 1, 2, 0.99999, 3, 1, 2, 0.65, 0.2))
 expect_equal(sortComponents(2, 3, params23r2, restricted=TRUE), c(0.2, 0.1, 0.3, 0.9, 0.2, 0.2, 0.1, 0.3, 0.5, 0.3))
})
