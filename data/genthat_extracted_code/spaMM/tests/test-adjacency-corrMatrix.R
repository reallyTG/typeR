cat("\ntest-adjacency-corrMatrix: adjacency (dense,sparse) vs. corrMatrix() (dense,sparse * LevM or not), for HGLM with offset:\n")

data("scotlip")

adjfit <- fitme(cases~I(prop.ag/10) +adjacency(1|gridcode)+(1|gridcode)+offset(log(expec)),
                adjMatrix=Nmatrix,
                rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                fixed=list(rho=0.1), 
                family=poisson(),data=scotlip)
expectedMethod <- "sXaug_EigenDense_QRP_Chol_scaled" ## bc data too small to switch to sparse
if (interactive()) {
  if (! (expectedMethod %in% adjfit$MME_method)) {
    message(paste('! ("',expectedMethod,'" %in% adjfit$MME_method): was a non-default option selected?'))
  }
} else testthat::expect_true(expectedMethod %in% adjfit$MME_method) 
oldop <- spaMM.options(sparse_precision=TRUE)
adjfitsp <- fitme(cases~I(prop.ag/10) +adjacency(1|gridcode)+(1|gridcode)+offset(log(expec)),
                  adjMatrix=Nmatrix,
                  rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                  fixed=list(rho=0.1), 
                  family=poisson(),data=scotlip)
testthat::expect_true("AUGI0_ZX_sparsePrecision" %in% adjfitsp$MME_method)
spaMM.options(oldop)
if (spaMM.getOption("EigenDense_QRP_method")==".lmwithQR") {
  testthat::expect_true(diff(range(logLik(adjfit),logLik(adjfitsp)))<4e-8) 
  testthat::expect_true(max(abs(range(get_predVar(adjfit)-get_predVar(adjfitsp))))<1.8e-5)
} else {
  testthat::expect_true(diff(range(logLik(adjfit),logLik(adjfitsp)))<2e-8) 
  testthat::expect_true(max(abs(range(get_predVar(adjfit)-get_predVar(adjfitsp))))<8e-6)
}

## same using corrMatrix()
if (spaMM.getOption("example_maxtime")>7.10) { 
  precmat <- diag(56)-0.1*Nmatrix   ## equivalent to adjacency model with rho=0.1
  colnames(precmat) <- rownames(precmat) <- seq(56)
  covmat <- solve(precmat)
  colnames(covmat) <- rownames(covmat) <- seq(56)
  precfit <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                   covStruct=list(precision=precmat),
                   rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                   #fixed=list(lambda=c(0.1,0.05)), 
                   family=poisson(),data=scotlip,control.HLfit=list(LevenbergM=FALSE))
  testthat::expect_true("AUGI0_ZX_sparsePrecision" %in% precfit$MME_method)
  precfitLM <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                     covStruct=list(precision=precmat),
                     rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                     #fixed=list(lambda=c(0.1,0.05)), 
                     family=poisson(),data=scotlip,control.HLfit=list(LevenbergM=TRUE))
  covfit <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                  covStruct=list(corrMatrix=covmat),
                  rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                  #fixed=list(lambda=c(0.1,0.05)), 
                  family=poisson(),data=scotlip)
  testthat::expect_true("dgCMatrix" %in% covfit$MME_method)
  testthat::expect_equal(logLik(covfit),c(p_v=-168.12966973),tol=5e-5) ## all methods are equally sensitive to the initial value (note that one lambda->0)
  testthat::expect_true(max(abs(range(get_predVar(covfit)-get_predVar(precfit))))<4e-6)  
  if (spaMM.getOption("EigenDense_QRP_method")==".lmwithQR") {
    testthat::expect_true(max(abs(range(get_predVar(adjfit)-get_predVar(covfit))))<9e-6) 
  } else testthat::expect_true(max(abs(range(get_predVar(adjfit)-get_predVar(covfit))))<6e-6) 
  covfitLM <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                    covStruct=list(corrMatrix=covmat),
                    rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=1L),
                    #fixed=list(lambda=c(0.1,0.05)), 
                    family=poisson(),data=scotlip,control.HLfit=list(LevenbergM=c(LevenbergM=TRUE))) ## 
  if (spaMM.getOption("EigenDense_QRP_method")==".lmwithQR") {
    testthat::expect_true(diff(range(logLik(covfit),logLik(covfitLM),logLik(precfitLM),logLik(adjfit),logLik(adjfitsp)))<5e-8) 
  } else testthat::expect_true(diff(range(logLik(covfit),logLik(covfitLM),logLik(precfitLM),logLik(adjfit),logLik(adjfitsp)))<3e-8) 
  # : correctness sensitive to w.resid <- damped_WLS_blob$w.resid.
  
  if (FALSE) { ## single IRLS fit sensitive to w.resid <- damped_WLS_blob$w.resid
    oldop <- spaMM.options(sparse_precision=FALSE)
    aaaa <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                  covStruct=list(corrMatrix=covmat),
                  rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=3L),
                  fixed=list(lambda=c(0.05,0.05)), 
                  family=poisson(),data=scotlip,control.HLfit=list(LevenbergM=c(LevenbergM=TRUE)))
    bbbb <- fitme(cases~I(prop.ag/10) +corrMatrix(1|gridcode)+(1|gridcode)+offset(log(expec)),
                  covStruct=list(precision=precmat),
                  rand.family=list(gaussian(),Gamma(log)), #verbose=c(TRACE=3L),
                  fixed=list(lambda=c(0.05,0.05)), 
                  family=poisson(),data=scotlip,control.HLfit=list(LevenbergM=c(LevenbergM=TRUE)))
  }
}

