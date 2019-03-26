cat("\ntest Nugget:")

data("Loaloa")
## use 1st 30 obs as this is slow:
loafit <- corrHLfit(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
          +Matern(1|longitude+latitude),
          data=Loaloa[1:30,],family=binomial(),
          init.corrHLfit=list(Nugget=0.1),ranFix=list(nu=0.5)) 
corrpars <- get_ranPars(loafit,which="corrPars")
testthat::expect_equal(attr(corrpars,"type")[["1"]],list(nu="fix",Nugget="outer",rho="outer"))
testthat::expect_equal(corrpars[["1"]]$Nugget,0.0458,tolerance=5e-5) 
## NB flat p_bv for Nugget; nloptr and bobyqa reach slightly diff values and L-BFGS-B performs poorly
set.seed(123)
Loaloa$id <- seq(nrow(Loaloa))

if (FALSE) { ## the most interesting test is already in test-predVar
  # test predVar with two *estimated* lambda
  tworanefs <- fitme(cbind(npos,ntot-npos)~1+(1|id)+Matern(1|longitude+latitude),
                     data=Loaloa[1:30,],family=binomial(),fixed=list(nu=0.5)) 
  ## using single-ranef code
  ranefstwo <- fitme(cbind(npos,ntot-npos)~1+Matern(1|longitude+latitude)+(1|id),
                     data=Loaloa[1:30,],family=binomial(),fixed=list(nu=0.5)) 
  ## using single-ranef code
  testthat::expect_true(diff(range(get_predVar(tworanefs)[1:5]-get_predVar(ranefstwo)[1:5]))<1e-9)
  
  ## Through Nugget we can assess the effect of uncertainty in the sum of the two lambda's. 
  #  The effect appears larger than expected from the magnitude of lambda(1|id) (or of Nugget)
  oneranef <- fitme(cbind(npos,ntot-npos)~1+Matern(1|longitude+latitude),
                    data=Loaloa[1:30,],family=binomial(),init=list(Nugget=0.1),fixed=list(nu=0.5)) 
  get_predVar(oneranef)[1:5] ## using single-ranef code
  # Speculations:
  # strong uncertainty whether Nugget (or (1|id))  has really zero variance translates into large reported dispVar component 
  # particularly at large distances / exterior locations, as the Matern and (1|id) predictions are quite distinct here.  
  # Mathematically this is reflected dv or dwdloglam off diagonal blocks similar in magnitude to diag blocks;
  # This means that d u_1 / d lambda_1 ~ d u_2 / d lambda_1 in magnitude, and logdisp cov is nearly singular.
}
