library(tsfa)


### Name: distribution.factorsEstEval
### Title: Distribution of Time Series Factors Estimates
### Aliases: distribution.factorsEstEval
### Keywords: ts

### ** Examples

  if (require("CDNmoney")){
    data("CanadianMoneyData.asof.6Feb2004", package="CDNmoney")

    ### Construct data
 
    cpi <- 100 * M1total / M1real
    seriesNames(cpi) <- "CPI"
    popm <- M1total / M1PerCapita
    seriesNames(popm) <- "Population of Canada"
 
    z <- tframed(tbind(
  	MB2001,
  	MB486 + MB452 + MB453 ,
  	NonbankCheq,
  	MB472 + MB473 + MB487p,
  	MB475,
  	NonbankNonCheq + MB454 + NonbankTerm + MB2046 + MB2047 + MB2048 +
  	MB2057 + MB2058 + MB482),
  	names=c("currency", "personal cheq.", "NonbankCheq",
  	"N-P demand & notice", "N-P term", "Investment")
  	)

    z <- tfwindow(z, start=c(1986,1))
    if( all(c(2003,12) ==end(z))) z <-tfwindow(z, end=c(2003,11))
    MBcomponents <- 1e8 * z/matrix(tfwindow(popm * cpi,tf=tframe(z)), Tobs(z),6)
 
    ### Specify "true" parameters and factors
 
    Omega <- diag(c(72.63, 1233, 87.33,
  		629.4, 3968, 12163))
 
    Boblq <- t(matrix(c(
       8.84,   5.20,
      23.82, -12.57,
       5.18,  -1.97,
      36.78,  16.94,
      -2.84,  31.02,
       2.60,  47.63), 2,6))
 
    PhiOblq <- matrix(c( 1.0, 0.00949, 0.00949, 1.0),2,2)

    etaBart <- MBcomponents %*% solve(Omega) %*% Boblq %*% (
  		solve( t(Boblq) %*% solve(Omega) %*% Boblq ) )

    DetaBart <- diff(etaBart, lag=1)
    SDE      <- cov(DetaBart)
    RR1 <- chol(SDE)	  # upper triangular: SDE = RR1' RR1
    RR2 <- chol(PhiOblq)  # ditto
    PP  <- t(RR2) %*% solve(t(RR1))
    Psi       <- 0.5 * Omega

    etaTrue <- tframed(etaBart %*% t(PP), tf=tframe(MBcomponents))

    ### run Monte Carlo  N.B. replications would typically be much larger

    require("EvalEst")
 
    EE.ML5 <- EstEval(TSFmodel(Boblq, f=etaTrue, positive.measures=FALSE),
      replications=5, quiet=FALSE,
      simulation.args=list(Cov=Psi, noIC=TRUE),
      estimation="estTSF.ML", estimation.args=list(2, BpermuteTarget=Boblq),
      criterion ="TSFmodel")
 
    distribution(factors(EE.ML5))
    distribution(factors(EE.ML5), cumulate=FALSE)
    distribution(diff(factors(EE.ML5)))
    distribution(diff(factors(EE.ML5)), cumulate=FALSE)
  }



