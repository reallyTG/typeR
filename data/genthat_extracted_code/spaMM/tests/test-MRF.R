if (packageVersion("spaMM")>"2.5.32") {
  cat("\ntest MRF:\n")
  
  data("blackcap")
  (mrf <- HLCor(migStatus ~ 1 + multiSAR(1|latitude+longitude,margin=5,levels=1),data=blackcap,
                HLmethod="ML",ranPars=list(phi=1,lambda=1,corrPars=list("1"=list(kappa=1)))) )
  (p1 <- predict(mrf)[2:3,])
  (p2 <- predict(mrf, newdata=mrf$data[2:3,]))
  testthat::expect_true(diff(range(p1-p2))<1e-12)
}
