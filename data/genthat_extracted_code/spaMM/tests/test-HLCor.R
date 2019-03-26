cat("\ntest HLCor:")
# HLCor

if (spaMM.getOption("example_maxtime")>1.5) { # test no longer fvery informative, cf related test in test-predVar
  data("Loaloa")
  hl <- HLCor(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
              +Matern(1|longitude+latitude),data=Loaloa,
              family=binomial(),ranPars=list(nu=0.5,rho=1/0.7)) 
  
  testthat::expect_equal(hl$APHLs$p_v,-645.7328,tolerance=1e-04)
}
