# confint
cat("\ntest confint() for HLfit, corrHLfit, and fitme:\n")
data("wafers")
wfit <- HLfit(y ~X1+(1|batch),family=Gamma(log),data=wafers,HLmethod="ML")
ci <- confint(wfit,"X1")

testthat::expect_equal(ci$interval[[1]],0.01828659,tolerance=1e-4)
testthat::expect_equal(ci$interval[[2]],0.17271333,tolerance=1e-4)

#### Checks of consistency of procedures for profiling out one or two parameters (with fixed phi and lambda only for a faster test).
## The CI's of the more constrained model should be within the other (even if both fits coincide at the ML, the additional constraint may matter at the bounds)

## with corrHLfit
data("blackcap")
fitobject <- corrHLfit(migStatus ~ means + Matern(1|latitude+longitude),data=blackcap,HLmethod="ML",
                       init.corrHLfit=list(nu=0.535929513,rho=0.007485725),ranFix=list(phi=0.05,lambda=2))
ci <- confint(fitobject,"means")
testthat::expect_equal(ci$interval[[1]],0.1606797,tolerance=1e-4)
testthat::expect_equal(ci$interval[[2]],0.9558826,tolerance=1e-4)
refitobject <- corrHLfit(migStatus ~ means + Matern(1|latitude+longitude),data=blackcap,HLmethod="ML",
                         init.corrHLfit=list(rho=0.007485725),ranFix=list(nu=0.535929513,phi=0.05,lambda=2))
ci <- confint(refitobject,"means")
testthat::expect_equal(ci$interval[[1]],0.1586536,tolerance=1e-4)
testthat::expect_equal(ci$interval[[2]],0.9570798,tolerance=1e-4)

## with fitme (derived from gentle intro)
rSample <- function(nb,rho,sigma2_u,resid,intercept,slope,pairs=TRUE) {
  ## sample pairs of adjacent locations
  if (pairs) {
    x <- rnorm(nb/2); x <- c(x,x+0.001)
    y <- rnorm(nb/2); y <- c(y,y+0.001)
  } else {x <- rnorm(nb);y <- rnorm(nb)}
  dist <- dist(cbind(x,y)) ## distance matrix between locations
  m <- exp(-rho*as.matrix(dist)) ## correlation matrix
  b <- MASS::mvrnorm(1,rep(0,nb),m*sigma2_u) ## correlated random effects
  pred <- sample(nb) ##  some predictor variable
  obs <- intercept+slope*pred + b +rnorm(nb,0,sqrt(resid)) ## response
  data.frame(obs=obs,x,y,pred=pred)
}

set.seed(123)
d1 <- rSample(nb=40,rho=3,sigma2_u=0.5,resid=0.5,intercept=-1,slope=0.1)
HLMf <- fitme(obs~pred+Matern(1|x+y),init=list(rho=59.11287),fixed=list(nu=48.96201,phi=0.447761,lambda=0.3697),data=d1,method="ML")
ci <- confint(HLMf,"pred") 
testthat::expect_equal(ci$interval[[1]],0.06483438,tolerance=1e-4) 
testthat::expect_equal(ci$interval[[2]],0.10567544,tolerance=1e-4)
HLM <- fitme(obs~pred+Matern(1|x+y),init=list(nu=48.96201,rho=59.11287),fixed=list(phi=0.447761,lambda=0.3697),data=d1,method="ML")
ci <- confint(HLM,"pred") ## practically identical in the two fits (+ nu drifts to higher values whatever the initial one)
testthat::expect_equal(ci$interval[[1]],0.06483437,tolerance=1e-4)
testthat::expect_equal(ci$interval[[2]],0.10567543,tolerance=1e-4)

# compar to lme4
if(requireNamespace("lme4", quietly = TRUE)) {
  data("sleepstudy",package = "lme4")
  fit <- fitme(Reaction ~ Days + (1|Subject), data = sleepstudy)
  fitci <- confint(fit, parm = "Days")$interval
  fit_mer <- lme4::lmer(Reaction ~ Days + (1|Subject), data = sleepstudy)
  testthat::expect_true(diff(range(suppressWarnings(confint(fit_mer))[4, ]-fitci))<1e-5) ## suppress bobyqa conv warning in lme4:::optwrap
}