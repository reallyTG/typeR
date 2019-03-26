
context("Checking meta-analysis example: TB dataset")

test_that("results are correct for the data preparation (pairiwise meta-analysis) function.", {
  skip_on_cran()
  ### load TB dataset
  data(TBdat, package="nmaINLA")
  ### Create the dataset suitable for INLA
  TBdatINLA <- create_INLA_dat_pair(TBdat$TRT, TBdat$CON, TBdat$TRTTB, TBdat$CONTB)
  ### compare with results
  expect_equivalent(round(TBdatINLA$data.cont$Y[3], 3), -1.386)
  expect_equivalent(TBdatINLA$data.arm$Y[3], 29)

})

## Fitting a pairwise random effects meta-analysis model
test_that("results are correct for fitting (pairiwise meta-analysis) function.", {
  skip_on_cran()
  data(TBdat, package="nmaINLA")
  ### Create the dataset suitable for INLA
  TBdatINLA <- create_INLA_dat_pair(TBdat$TRT, TBdat$CON, TBdat$TRTTB, TBdat$CONTB)

  if(requireNamespace('INLA', quietly = TRUE)){
    require('INLA', quietly = TRUE)
    fit.TB.RE.INLA <- meta_inla(TBdatINLA, type = 'RE',
                                approach = 'arm-level',
                                tau.prior = 'uniform', tau.par = c(0, 5))
  }
  ### compare with results
  expect_equivalent(round(fit.TB.RE.INLA$nu[1], 2), -0.76)
  expect_equivalent(round(fit.TB.RE.INLA$nu[2], 2), 0.22)

})

context("Checking a NMA example: Smoking dataset")


### Create the dataset suitable for INLA
test_that("results are correct for the data preparation (network meta-analysis) function.", {
  skip_on_cran()
  ### load TB dataset
  data("Smokdat", package="nmaINLA")
  SmokdatINLA <- create_INLA_dat(dat = Smokdat,
                                 armVars = c('treatment' = 't', 'responders' = 'r',
                                             'sampleSize' = 'n'),
                                 nArmsVar = 'na')
  ### compare with results
  expect_equivalent(SmokdatINLA$responders[1:3], c(9, 23, 10))
  expect_equivalent(SmokdatINLA$baseline[47:50], c(3, 3, 3, 3))

})



test_that("results are correct for fitting (network meta-analysis) function.", {
  skip_on_cran()
  SmokdatINLA <- create_INLA_dat(dat = Smokdat,
                                 armVars = c('treatment' = 't', 'responders' = 'r',
                                             'sampleSize' = 'n'),
                                 nArmsVar = 'na')

  ## Fitting a pairwise random effects meta-analysis model
  if(requireNamespace('INLA', quietly = TRUE)){
    require('INLA', quietly = TRUE)
    fit.Smok.cons.INLA <- nma_inla(SmokdatINLA, likelihood = 'binomial', type = 'consistency',
                                   tau.prior = 'uniform', tau.par = c(0, 5))
  }
  ### compare with results
  expect_equivalent(round(fit.Smok.cons.INLA$d_params[, 1], 2), c(0.49, 0.84, 1.10))
  expect_equivalent(round(fit.Smok.cons.INLA$hyperpar[1:2], 2), c(0.84, 0.18))

})
