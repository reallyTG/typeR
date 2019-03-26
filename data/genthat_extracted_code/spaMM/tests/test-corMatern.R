cat("\ntest spaMM::corMatern for lme():")

data("blackcap")
blackcapD <-cbind(blackcap,dummy=1) ## obscure, isn't it? 
requireNamespace("nlme")
## With method= 'ML' in lme, The correlated random effect is described 
##  as a correlated residual error and no extra residual variance is fitted:
bf <- nlme::lme(fixed = migStatus ~ means, data = blackcapD, random = ~ 1 | dummy, 
    correlation = corMatern(form = ~ longitude+latitude  | dummy), 
    method = "ML", control=nlme::lmeControl(sing.tol=1e-20))

testthat::expect_equal(logLik(bf)[[1]],-7.941674,tolerance=1e-6)
testthat::expect_equal(exp((bf$modelStruct$corStruct)[[1]]),18.3595917,tolerance=1e-5) ## range =1/rho 
testthat::expect_equal(exp((bf$modelStruct$corStruct)[[2]]),0.62857441,tolerance=1e-5) ## nu (not range as comment said for a long time )
# parametrisation was modified in bf$modelStruct$corStruct from log(range =1/rho) to log(rho) 

if (FALSE) {
  requireNamespace("nlme")
  data("Orthodont",package = "nlme")
  set.seed(1)
  d <- data.frame(x = rnorm(50), y = rnorm(50))
  nlme::gls(distance ~ Sex, data=Orthodont, correlation = corExp(1,form = ~1 | Subject)) #This works
  
  # use corMatern(form = ~age | Subject) to have distances according to age ! 
  str(csage <- corMatern(form = ~age | Subject)) 
  str(csage <- Initialize(csage, data = Orthodont[1:8,])) 
  corFactor(csage)
  
  ## corExp
  str(ce1 <- nlme::corExp(1,form = ~1 | Subject)) 
  locdata <- Orthodont[0+(1:8),]
  str(ce1o <- Initialize(ce1, data = locdata)) 
  corMatrix(ce1o)
  set.seed(123); 
  Xy <- matrix(runif(nrow(locdata)))
  recalc(ce1o,list(Xy=Xy,logLik=0))
  coef(ce1o) <- -log(2) # - log(rho)
  Variogram(ce1o)
  
  ## ~ cor exp via corMatern
  str(cs1 <- corMatern(c(1,0.5),form = ~1 | Subject)) 
  str(cs1n <- Initialize.corMatern(cs1, data =locdata)) 
  corMatrix.corMatern(cs1n)
  recalc.corMatern(cs1n,list(Xy=Xy,logLik=0))
  Variogram.corMatern(cs1n)
  coef(cs1n) <- c(log(2),log(0.5)) # log(rho), log(nu)
  
}

