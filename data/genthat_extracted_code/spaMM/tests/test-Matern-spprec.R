cat("test-Matern-spprec")
if (spaMM.getOption("example_maxtime")>0.7) { ##  not based on real timing
  data("blackcap")
  MLcorMat <- MaternCorr(proxy::dist(blackcap[,c("latitude","longitude")]),
                         nu=4,rho=0.4)
  blackcap$name <- as.factor(rownames(blackcap))                
  ## (1) Single variable present in the data 
  spaMM.options(sparse_precision=TRUE)
  (f1 <- HLCor(migStatus ~ means+ corrMatrix(1|name),data=blackcap,
        corrMatrix=MLcorMat,HLmethod="ML"))
  f2 <- corrHLfit(migStatus ~ means+ Matern(1|latitude+longitude),data=blackcap,
            corrMatrix=MLcorMat,ranFix=list(corrPars=list("1"=list(nu=4,rho=0.4))),HLmethod="ML")
  spaMM.options(sparse_precision=FALSE)
  f3 <- HLCor(migStatus ~ means+ corrMatrix(1|name),data=blackcap,
        corrMatrix=MLcorMat,HLmethod="ML")
  f4 <- corrHLfit(migStatus ~ means+ Matern(1|latitude+longitude),data=blackcap,
            corrMatrix=MLcorMat,ranFix=list(corrPars=list("1"=list(nu=4,rho=0.4))),HLmethod="ML")
  spaMM.options(sparse_precision=NULL)
  testthat::expect_true(diff(range(c(logLik(f1),logLik(f2),logLik(f3),logLik(f4))))<1e-10)
}


