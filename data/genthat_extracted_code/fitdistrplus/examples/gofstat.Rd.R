library(fitdistrplus)


### Name: gofstat
### Title: Goodness-of-fit statistics
### Aliases: gofstat print.gofstat.fitdist
### Keywords: distribution

### ** Examples


# (1) fit of two distributions to the serving size data
# by maximum likelihood estimation
# and comparison of goodness-of-fit statistics
#

data(groundbeef)
serving <- groundbeef$serving
(fitg <- fitdist(serving, "gamma"))
gofstat(fitg)
(fitln <- fitdist(serving, "lnorm"))
gofstat(fitln)

gofstat(list(fitg, fitln))


# (2) fit of two discrete distributions to toxocara data
# and comparison of goodness-of-fit statistics
#

data(toxocara)
number <- toxocara$number

fitp <- fitdist(number,"pois")
summary(fitp)
plot(fitp)

fitnb <- fitdist(number,"nbinom")
summary(fitnb)
plot(fitnb)

gofstat(list(fitp, fitnb),fitnames = c("Poisson","negbin"))

# (3) Use of Chi-squared results in addition to
#     recommended statistics for continuous distributions
#

set.seed(1234)
x4 <- rweibull(n=1000,shape=2,scale=1)
# fit of the good distribution
f4 <- fitdist(x4,"weibull")

# fit of a bad distribution
f4b <- fitdist(x4,"cauchy")

gofstat(list(f4,f4b),fitnames=c("Weibull", "Cauchy"))




