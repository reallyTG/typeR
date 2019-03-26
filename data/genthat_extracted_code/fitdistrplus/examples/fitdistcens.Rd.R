library(fitdistrplus)


### Name: fitdistcens
### Title: Fitting of univariate distributions to censored data
### Aliases: fitdistcens plot.fitdistcens print.fitdistcens
###   summary.fitdistcens logLik.fitdistcens vcov.fitdistcens
###   coef.fitdistcens
### Keywords: distribution

### ** Examples

# (1) Fit of a lognormal distribution to bacterial contamination data
#
data(smokedfish)
fitsf  <-  fitdistcens(smokedfish,"lnorm")
summary(fitsf)
# default plot using the Wang technique (see ?plotdiscens for details)
plot(fitsf)
# plot using the Turnbull algorithm (see ?plotdiscens for details)
# with confidence intervals for the empirical distribution
plot(fitsf, NPMLE = TRUE, NPMLE.method = "Turnbull", Turnbull.confint = TRUE)
# basic plot using intervals and points (see ?plotdiscens for details)
plot(fitsf, NPMLE = FALSE)
# plot of the same fit using the Turnbull algorithm in logscale
cdfcompcens(fitsf,main="bacterial contamination fits",
    xlab="bacterial concentration (CFU/g)",ylab="F",
    addlegend = FALSE,lines01 = TRUE, xlogscale = TRUE, xlim = c(1e-2,1e2))
# zoom on large values of F
cdfcompcens(fitsf,main="bacterial contamination fits",
    xlab="bacterial concentration (CFU/g)",ylab="F",
    addlegend = FALSE,lines01 = TRUE, xlogscale = TRUE, 
    xlim = c(1e-2,1e2),ylim=c(0.4,1))

# (2) Fit of a normal distribution on acute toxicity values 
# of fluazinam (in decimal logarithm) for
# macroinvertebrates and zooplancton, using maximum likelihood estimation
# to estimate what is called a species sensitivity distribution 
# (SSD) in ecotoxicology
#

data(fluazinam)
log10EC50 <-log10(fluazinam)
fln <- fitdistcens(log10EC50,"norm")
fln
summary(fln)
plot(fln)

# (3) defining your own distribution functions, here for the Gumbel distribution
# for other distributions, see the CRAN task view dedicated to 
# probability distributions
#

dgumbel  <-  function(x,a,b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
pgumbel  <-  function(q,a,b) exp(-exp((a-q)/b))
qgumbel  <-  function(p,a,b) a-b*log(-log(p))
fg <- fitdistcens(log10EC50,"gumbel",start=list(a=1,b=1))
summary(fg)
plot(fg)

# (4) comparison of fits of various distributions
# 

fll <- fitdistcens(log10EC50,"logis")
summary(fll)

cdfcompcens(list(fln,fll,fg),legendtext=c("normal","logistic","gumbel"),
xlab = "log10(EC50)")

# (5) how to change the optimisation method?
#

fitdistcens(log10EC50,"logis",optim.method="Nelder-Mead")
fitdistcens(log10EC50,"logis",optim.method="BFGS") 
fitdistcens(log10EC50,"logis",optim.method="SANN") 

# (6) custom optimisation function - example with the genetic algorithm
#
## Not run: 
##D 
##D     #wrap genoud function rgenoud package
##D     mygenoud  <-  function(fn, par, ...) 
##D     {
##D         require(rgenoud)
##D         res  <-  genoud(fn, starting.values=par, ...)        
##D         standardres  <-  c(res, convergence=0)
##D             
##D         return(standardres)
##D     }
##D 
##D     # call fitdistcens with a 'custom' optimization function
##D     fit.with.genoud <- fitdistcens(log10EC50,"logis", custom.optim=mygenoud, nvars=2,    
##D         Domains=cbind(c(0,0), c(5, 5)), boundary.enforcement=1, 
##D         print.level=1, hessian=TRUE)
##D 
##D     summary(fit.with.genoud)
## End(Not run)

# (7) estimation of the mean of a normal distribution 
# by maximum likelihood with the standard deviation fixed at 1 using the argument fix.arg
#
flnb <- fitdistcens(log10EC50, "norm", start = list(mean = 1),fix.arg = list(sd = 1))

# (8) Fit of a lognormal distribution on acute toxicity values of fluazinam for
# macroinvertebrates and zooplancton, using maximum likelihood estimation
# to estimate what is called a species sensitivity distribution 
# (SSD) in ecotoxicology, followed by estimation of the 5 percent quantile value of 
# the fitted distribution (which is called the 5 percent hazardous concentration, HC5,
# in ecotoxicology) and estimation of other quantiles.

data(fluazinam)
log10EC50 <-log10(fluazinam)
fln <- fitdistcens(log10EC50,"norm")

quantile(fln, probs = 0.05)
quantile(fln, probs = c(0.05, 0.1, 0.2))

# (9) Fit of a lognormal distribution on 72-hour acute salinity tolerance (LC50 values)
# of riverine macro-invertebrates using maximum likelihood estimation

data(salinity)
log10LC50 <-log10(salinity)
fln <- fitdistcens(log10LC50,"norm")
plot(fln)




