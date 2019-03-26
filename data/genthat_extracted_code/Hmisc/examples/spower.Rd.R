library(Hmisc)


### Name: spower
### Title: Simulate Power of 2-Sample Test for Survival under Complex
###   Conditions
### Aliases: spower print.spower Quantile2 print.Quantile2 plot.Quantile2
###   logrank Gompertz2 Lognorm2 Weibull2
### Keywords: htest survival

### ** Examples

# Simulate a simple 2-arm clinical trial with exponential survival so
# we can compare power simulations of logrank-Cox test with cpower()
# Hazard ratio is constant and patients enter the study uniformly
# with follow-up ranging from 1 to 3 years
# Drop-in probability is constant at .1 and drop-out probability is
# constant at .175.  Two-year survival of control patients in absence
# of drop-in is .8 (mortality=.2).  Note that hazard rate is -log(.8)/2
# Total sample size (both groups combined) is 1000
# % mortality reduction by intervention (if no dropin or dropout) is 25
# This corresponds to a hazard ratio of 0.7283 (computed by cpower)


cpower(2, 1000, .2, 25, accrual=2, tmin=1, 
       noncomp.c=10, noncomp.i=17.5)


ranfun <- Quantile2(function(x)exp(log(.8)/2*x),
                    hratio=function(x)0.7283156,
                    dropin=function(x).1,
                    dropout=function(x).175)


rcontrol <- function(n) ranfun(n, what='control')
rinterv  <- function(n) ranfun(n, what='int')
rcens    <- function(n) runif(n, 1, 3)


set.seed(11)   # So can reproduce results
spower(rcontrol, rinterv, rcens, nc=500, ni=500, 
       test=logrank, nsim=50)  # normally use nsim=500 or 1000

## Not run: 
##D # Run the same simulation but fit the Cox model for each one to
##D # get log hazard ratios for the purpose of assessing the tightness
##D # confidence intervals that are likely to result
##D 
##D set.seed(11)
##D u <- spower(rcontrol, rinterv, rcens, nc=500, ni=500, 
##D        test=logrank, nsim=50, cox=TRUE)
##D u
##D v <- print(u)
##D v[c('MOElower','MOEupper','SE')]
## End(Not run)

# Simulate a 2-arm 5-year follow-up study for which the control group's
# survival distribution is Weibull with 1-year survival of .95 and
# 3-year survival of .7.  All subjects are followed at least one year,
# and patients enter the study with linearly increasing probability  after that
# Assume there is no chance of dropin for the first 6 months, then the
# probability increases linearly up to .15 at 5 years
# Assume there is a linearly increasing chance of dropout up to .3 at 5 years
# Assume that the treatment has no effect for the first 9 months, then
# it has a constant effect (hazard ratio of .75)


# First find the right Weibull distribution for compliant control patients
sc <- Weibull2(c(1,3), c(.95,.7))
sc


# Inverse cumulative distribution for case where all subjects are followed
# at least a years and then between a and b years the density rises
# as (time - a) ^ d is a + (b-a) * u ^ (1/(d+1))


rcens <- function(n) 1 + (5-1) * (runif(n) ^ .5)
# To check this, type hist(rcens(10000), nclass=50)


# Put it all together


f <- Quantile2(sc, 
      hratio=function(x)ifelse(x<=.75, 1, .75),
      dropin=function(x)ifelse(x<=.5, 0, .15*(x-.5)/(5-.5)),
      dropout=function(x).3*x/5)


par(mfrow=c(2,2))
# par(mfrow=c(1,1)) to make legends fit
plot(f, 'all', label.curves=list(keys='lines'))


rcontrol <- function(n) f(n, 'control')
rinterv  <- function(n) f(n, 'intervention')


set.seed(211)
spower(rcontrol, rinterv, rcens, nc=350, ni=350, 
       test=logrank, nsim=50)  # normally nsim=500 or more
par(mfrow=c(1,1))

# Compose a censoring time generator function such that at 1 year
# 5% of subjects are accrued, at 3 years 70% are accured, and at 10
# years 100% are accrued.  The trial proceeds two years past the last
# accrual for a total of 12 years of follow-up for the first subject.
# Use linear interporation between these 3 points

rcens <- function(n)
{
  times <- c(0,1,3,10)
  accrued <- c(0,.05,.7,1)
  # Compute inverse of accrued function at U(0,1) random variables
  accrual.times <- approx(accrued, times, xout=runif(n))$y
  censor.times <- 12 - accrual.times
  censor.times
}

censor.times <- rcens(500)
# hist(censor.times, nclass=20)
accrual.times <- 12 - censor.times
# Ecdf(accrual.times)
# lines(c(0,1,3,10), c(0,.05,.7,1), col='red')
# spower(..., rcens=rcens, ...)

## Not run: 
##D # To define a control survival curve from a fitted survival curve
##D # with coordinates (tt, surv) with tt[1]=0, surv[1]=1:
##D 
##D Scontrol <- function(times, tt, surv) approx(tt, surv, xout=times)$y
##D tt <- 0:6
##D surv <- c(1, .9, .8, .75, .7, .65, .64)
##D formals(Scontrol) <- list(times=NULL, tt=tt, surv=surv)
##D 
##D # To use a mixture of two survival curves, with e.g. mixing proportions
##D # of .2 and .8, use the following as a guide:
##D #
##D # Scontrol <- function(times, t1, s1, t2, s2)
##D #  .2*approx(t1, s1, xout=times)$y + .8*approx(t2, s2, xout=times)$y
##D # t1 <- ...; s1 <- ...; t2 <- ...; s2 <- ...;
##D # formals(Scontrol) <- list(times=NULL, t1=t1, s1=s1, t2=t2, s2=s2)
##D 
##D # Check that spower can detect a situation where generated censoring times
##D # are later than all failure times
##D 
##D rcens <- function(n) runif(n, 0, 7)
##D f <- Quantile2(scontrol=Scontrol, hratio=function(x).8, tmax=6)
##D cont <- function(n) f(n, what='control')
##D int  <- function(n) f(n, what='intervention')
##D spower(rcontrol=cont, rinterv=int, rcens=rcens, nc=300, ni=300, nsim=20)
##D 
##D # Do an unstratified logrank test
##D library(survival)
##D # From SAS/STAT PROC LIFETEST manual, p. 1801
##D days <- c(179,256,262,256,255,224,225,287,319,264,237,156,270,257,242,
##D           157,249,180,226,268,378,355,319,256,171,325,325,217,255,256,
##D           291,323,253,206,206,237,211,229,234,209)
##D status <- c(1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1,1,0,
##D             0,rep(1,19))
##D treatment <- c(rep(1,10), rep(2,10), rep(1,10), rep(2,10))
##D sex <- Cs(F,F,M,F,M,F,F,M,M,M,F,F,M,M,M,F,M,F,F,M,
##D           M,M,M,M,F,M,M,F,F,F,M,M,M,F,F,M,F,F,F,F)
##D data.frame(days, status, treatment, sex)
##D table(treatment, status)
##D logrank(Surv(days, status), treatment)  # agrees with p. 1807
##D # For stratified tests the picture is puzzling.
##D # survdiff(Surv(days,status) ~ treatment + strata(sex))$chisq
##D # is 7.246562, which does not agree with SAS (7.1609)
##D # But summary(coxph(Surv(days,status) ~ treatment + strata(sex)))
##D # yields 7.16 whereas summary(coxph(Surv(days,status) ~ treatment))
##D # yields 5.21 as the score test, not agreeing with SAS or logrank() (5.6485)
## End(Not run)



