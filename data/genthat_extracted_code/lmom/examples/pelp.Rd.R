library(lmom)


### Name: pelp
### Title: Parameter estimation for a general distribution by the method of
###   L-moments
### Aliases: pelp pelq
### Keywords: models

### ** Examples

## Gamma distribution -- rewritten so that its first parameter
## is a scale parameter
my.pgamma <- function(x, scale, shape) pgamma(x, shape=shape, scale=scale)
pelp(c(5,2), my.pgamma, start=c(1,1), bounds=c(0,Inf), type="s")
# We can also do the estimation suppressing our knowledge
# that one parameter is a shape parameter.
pelp(c(5,2), my.pgamma, start=c(1,1), bounds=c(0,Inf), type="n")
rm(my.pgamma)

## Kappa distribution -- has location, scale and 2 shape parameters
# Estimate via pelq
pel.out <- pelq(c(10,5,0.3,0.15), quakap, start=c(0,1,0,0), type="ls")
pel.out
# Check that L-moments of estimated distribution agree with the
# L-moments input to pelq()
lmrkap(pel.out$para)
# Compare with the distribution-specific routine pelkap
pelkap(c(10,5,0.3,0.15))
rm(pel.out)

# Similar results -- what's the advantage of the specific routine?
system.time(pelq(c(10,5,0.3,0.15), quakap, start=c(0,1,0,0), type="ls"))
system.time(pelkap(c(10,5,0.3,0.15)))

# Caution -- pelq() will not check that estimates are reasonable
lmom <- c(10,5,0.2,0.25)
pel.out <- pelq(lmom, quakap, start=c(0,1,0,0), type="ls")
pel.out
lmrkap(pel.out$para) # should be close to lmom, but tau_3 and tau_4 are not
# What happened? pelkap will tell us
try(pelkap(lmom))
rm(lmom, pel.out)

## Inverse Gaussian -- don't have explicit estimators for this
## distribution, but can use numerical methods
#
# CDF of inverse gaussian distribution
pig <- function(x, mu, lambda) {
  temp <- suppressWarnings(sqrt(lambda/x))
  xx <- pnorm(temp*(x/mu-1))+exp(2*lambda/mu+pnorm(temp*(x/mu+1),
              lower.tail=FALSE, log.p=TRUE))
  out <- ifelse(x<=0, 0, xx)
  out
}
# Fit to ozone data
data(airquality)
(lmom<-samlmu(airquality$Ozone))
pel.out <- pelp(lmom[1:2], pig, start=c(10,10), bounds=c(0,Inf))
pel.out
# First four L-moments of fitted distribution,
# for comparison with sample L-moments
lmrp(pig, pel.out$para[1], pel.out$para[2], bounds=c(0,Inf))
rm(pel.out)

## A Student t distribution with location and scale parameters
#
qstu <- function(p, xi, alpha, df) xi + alpha * qt(p, df)
# Estimate parameters.  Distribution is symmetric: use type="lss"
pelq(c(3,5,0,0.2345), qstu, start=c(0,1,10), type="lss")
# Doesn't converge (at least on the author's system) --
# try a different parametrization
qstu2 <- function(p, xi, alpha, shape) xi + alpha * qt(p, 1/shape)
# Now it converges
pelq(c(3,5,0,0.2345), qstu2, start=c(0,1,0.1), type="lss")
# Or try a different optimization method
pelq(c(3,5,0,0.2345), qstu, start=c(0,1,10), type="lss",
    method="uniroot", lower=2, upper=100)

## With trimmed L-moments, we can fit this distribution even when
## it does not have a finite mean ('df' less than 1)
set.seed(123456)
dat <- qstu(runif(1000), xi=3, alpha=5, df=0.75)
lmom <- samlmu(dat, trim=1)
lmom
# Note that pelq() infers 'trim=1' from the names of 'lmom'
pelq(lmom, qstu, start=c(0,1,10), type="lss",  method="uniroot",
  lower=0.51, upper=100)

rm(qstu, qstu2, dat, lmom)




