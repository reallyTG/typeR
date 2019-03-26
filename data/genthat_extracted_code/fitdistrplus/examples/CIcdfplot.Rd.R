library(fitdistrplus)


### Name: CIcdfplot
### Title: Empirical cumulative distribution function with pointwise
###   confidence intervals on probabilities or on quantiles
### Aliases: CIcdfplot
### Keywords: distribution

### ** Examples

# We choose a low number of bootstrap replicates in order to satisfy CRAN running times
# constraint.
# For practical applications, we recommend to use at least niter=501 or niter=1001.


# (1) Fit of an exponential distribution
#

set.seed(123)
s1 <- rexp(50, 1)
f1 <- fitdist(s1, "exp")
b1 <- bootdist(f1, niter= 11) #voluntarily low to decrease computation time

# plot 95 percent bilateral confidence intervals on y values (probabilities)
CIcdfplot(b1, CI.level= 95/100, CI.output = "probability")

# plot of the previous intervals as a band 
CIcdfplot(b1, CI.level= 95/100, CI.output = "probability", 
  CI.fill = "pink", CI.col = "red")

# plot of the previous intervals as a band without empirical and fitted dist. functions
CIcdfplot(b1, CI.level= 95/100, CI.output = "probability", CI.only = TRUE,
  CI.fill = "pink", CI.col = "red")
  
# same plot without contours
CIcdfplot(b1, CI.level= 95/100, CI.output = "probability", CI.only = TRUE,
  CI.fill = "pink", CI.col = "pink")

# plot 95 percent bilateral confidence intervals on x values (quantiles)
CIcdfplot(b1, CI.level= 95/100, CI.output = "quantile")


# plot 95 percent unilateral confidence intervals on quantiles
CIcdfplot(b1, CI.level = 95/100, CI.output = "quant", CI.type = "less", 
  CI.fill = "grey80", CI.col = "black", CI.lty = 1)
CIcdfplot(b1, CI.level= 95/100, CI.output = "quant", CI.type = "greater",
  CI.fill = "grey80", CI.col = "black", CI.lty = 1)

# (2) Fit of a normal distribution on acute toxicity log-transformed values of 
# endosulfan for nonarthropod invertebrates, using maximum likelihood estimation
# to estimate what is called a species sensitivity distribution 
# (SSD) in ecotoxicology, followed by estimation of the 5, 10 and 20 percent quantile  
# values of the fitted distribution, which are called the 5, 10, 20 percent hazardous 
# concentrations (HC5, HC10, HC20) in ecotoxicology, with their
# confidence intervals, from a small number of bootstrap 
# iterations to satisfy CRAN running times constraint and plot of the band
# representing pointwise confidence intervals on any quantiles (any HCx values)
# For practical applications, we recommend to use at least niter=501 or niter=1001.
#

data(endosulfan)
ATV <- subset(endosulfan, group == "NonArthroInvert")$ATV
log10ATV <- log10(subset(endosulfan, group == "NonArthroInvert")$ATV)
fln <- fitdist(log10ATV, "norm")
bln <- bootdist(fln, bootmethod ="param", niter=101)
quantile(bln, probs = c(0.05, 0.1, 0.2))
CIcdfplot(bln, CI.output = "quantile", CI.fill = "lightblue", CI.col = "blue",
          xlim = c(1,5))


# (3) Same type of example as example (2) from ecotoxicology
# with censored data
#
data(salinity)
log10LC50 <-log10(salinity)
fln <- fitdistcens(log10LC50,"norm")
bln <- bootdistcens(fln, niter=101)
(HC5ln <- quantile(bln,probs = 0.05))
CIcdfplot(bln, CI.output = "quantile", CI.fill = "lightblue", CI.col = "blue",
    xlab = "log10(LC50)",xlim=c(0.5,2),lines01 = TRUE)
# zoom around the HC5  
CIcdfplot(bln, CI.output = "quantile", CI.fill = "lightblue", CI.col = "blue",
          xlab = "log10(LC50)", lines01 = TRUE, xlim = c(0.8, 1.5), ylim = c(0, 0.1))
abline(h = 0.05, lty = 2) # line corresponding to a CDF of 5 percent




