library(fitdistrplus)


### Name: fluazinam
### Title: Species-Sensitivity Distribution (SSD) for Fluazinam
### Aliases: fluazinam
### Keywords: datasets

### ** Examples

# (1) load of data
#
data(fluazinam)

# (2) plot of data using Turnbull cdf plot
#
log10EC50 <-log10(fluazinam)
plotdistcens(log10EC50)

# (3) fit of a lognormal and a logistic distribution to data
# (classical distributions used for species sensitivity 
# distributions, SSD, in ecotoxicology)
# and visual comparison of the fits using Turnbull cdf plot 
#
fln <- fitdistcens(log10EC50,"norm")
summary(fln)

fll <- fitdistcens(log10EC50,"logis")
summary(fll)

cdfcompcens(list(fln,fll),legendtext=c("normal","logistic"),
xlab = "log10(EC50)")

# (4) estimation of the 5 percent quantile value of 
# the normal fitted distribution (5 percent hazardous concentration  : HC5)
# with its two-sided 95 percent confidence interval calculated by 
# non parametric bootstrap
# with a small number of iterations to satisfy CRAN running times constraint.
# For practical applications, we recommend to use at least niter=501 or niter=1001.
#
# in log10(EC50)
bln <- bootdistcens(fln, niter=101)
HC5ln <- quantile(bln, probs = 0.05)
# in EC50
10^(HC5ln$quantiles)
10^(HC5ln$quantCI)

# (5) estimation of the HC5 value
# with its one-sided 95 percent confidence interval (type "greater")
#
# in log10(EC50)
HC5lnb <- quantile(bln,probs = 0.05,CI.type="greater")

# in LC50
10^(HC5lnb$quantiles)
10^(HC5lnb$quantCI)




