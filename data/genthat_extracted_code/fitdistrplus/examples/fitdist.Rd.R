library(fitdistrplus)


### Name: fitdist
### Title: Fit of univariate distributions to non-censored data
### Aliases: fitdist plot.fitdist print.fitdist summary.fitdist
###   logLik.fitdist vcov.fitdist coef.fitdist
### Keywords: distribution

### ** Examples


# (1) fit of a gamma distribution by maximum likelihood estimation
#

data(groundbeef)
serving <- groundbeef$serving
fitg <- fitdist(serving, "gamma")
summary(fitg)
plot(fitg)
plot(fitg, demp = TRUE)
plot(fitg, histo = FALSE, demp = TRUE)
cdfcomp(fitg, addlegend=FALSE)
denscomp(fitg, addlegend=FALSE)
ppcomp(fitg, addlegend=FALSE)
qqcomp(fitg, addlegend=FALSE)


# (2) use the moment matching estimation (using a closed formula)
#

fitgmme <- fitdist(serving, "gamma", method="mme")
summary(fitgmme)

# (3) Comparison of various fits 
#

fitW <- fitdist(serving, "weibull")
fitg <- fitdist(serving, "gamma")
fitln <- fitdist(serving, "lnorm")
summary(fitW)
summary(fitg)
summary(fitln)
cdfcomp(list(fitW, fitg, fitln), legendtext=c("Weibull", "gamma", "lognormal"))
denscomp(list(fitW, fitg, fitln), legendtext=c("Weibull", "gamma", "lognormal"))
qqcomp(list(fitW, fitg, fitln), legendtext=c("Weibull", "gamma", "lognormal"))
ppcomp(list(fitW, fitg, fitln), legendtext=c("Weibull", "gamma", "lognormal"))
gofstat(list(fitW, fitg, fitln), fitnames=c("Weibull", "gamma", "lognormal"))

# (4) defining your own distribution functions, here for the Gumbel distribution
# for other distributions, see the CRAN task view 
# dedicated to probability distributions
#

dgumbel <- function(x, a, b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
pgumbel <- function(q, a, b) exp(-exp((a-q)/b))
qgumbel <- function(p, a, b) a-b*log(-log(p))

fitgumbel <- fitdist(serving, "gumbel", start=list(a=10, b=10))
summary(fitgumbel)
plot(fitgumbel)

# (5) fit discrete distributions (Poisson and negative binomial)
#

data(toxocara)
number <- toxocara$number
fitp <- fitdist(number,"pois")
summary(fitp)
plot(fitp)
fitnb <- fitdist(number,"nbinom")
summary(fitnb)
plot(fitnb)

cdfcomp(list(fitp,fitnb))
gofstat(list(fitp,fitnb))

# (6) how to change the optimisation method?
#

data(groundbeef)
serving <- groundbeef$serving
fitdist(serving, "gamma", optim.method="Nelder-Mead")
fitdist(serving, "gamma", optim.method="BFGS") 
fitdist(serving, "gamma", optim.method="SANN")

# (7) custom optimization function
#
## Not run: 
##D #create the sample
##D set.seed(1234)
##D mysample <- rexp(100, 5)
##D mystart <- list(rate=8)
##D 
##D res1 <- fitdist(mysample, dexp, start= mystart, optim.method="Nelder-Mead")
##D 
##D #show the result
##D summary(res1)
##D 
##D #the warning tell us to use optimise, because the Nelder-Mead is not adequate.
##D 
##D #to meet the standard 'fn' argument and specific name arguments, we wrap optimize, 
##D myoptimize <- function(fn, par, ...) 
##D {
##D     res <- optimize(f=fn, ..., maximum=FALSE)  
##D     #assume the optimization function minimize
##D     
##D     standardres <- c(res, convergence=0, value=res$objective, 
##D         par=res$minimum, hessian=NA)
##D     
##D     return(standardres)
##D }
##D 
##D #call fitdist with a 'custom' optimization function
##D res2 <- fitdist(mysample, "exp", start=mystart, custom.optim=myoptimize, 
##D     interval=c(0, 100))
##D 
##D #show the result
##D summary(res2)
## End(Not run)


# (8) custom optimization function - another example with the genetic algorithm
#
## Not run: 
##D     #set a sample
##D     fit1 <- fitdist(serving, "gamma")
##D     summary(fit1)
##D 
##D     #wrap genoud function rgenoud package
##D     mygenoud <- function(fn, par, ...) 
##D     {
##D         require(rgenoud)
##D         res <- genoud(fn, starting.values=par, ...)        
##D         standardres <- c(res, convergence=0)
##D             
##D         return(standardres)
##D     }
##D 
##D     #call fitdist with a 'custom' optimization function
##D     fit2 <- fitdist(serving, "gamma", custom.optim=mygenoud, nvars=2,    
##D         Domains=cbind(c(0, 0), c(10, 10)), boundary.enforcement=1, 
##D         print.level=1, hessian=TRUE)
##D 
##D     summary(fit2)
## End(Not run)

# (9) estimation of the standard deviation of a gamma distribution 
# by maximum likelihood with the shape fixed at 4 using the argument fix.arg
#

data(groundbeef)
serving <- groundbeef$serving
f1c  <- fitdist(serving,"gamma",start=list(rate=0.1),fix.arg=list(shape=4))
summary(f1c)
plot(f1c)

# (10) fit of a Weibull distribution to serving size data 
# by maximum likelihood estimation
# or by quantile matching estimation (in this example 
# matching first and third quartiles)
#

data(groundbeef)
serving <- groundbeef$serving
fWmle <- fitdist(serving, "weibull")
summary(fWmle)
plot(fWmle)
gofstat(fWmle)

fWqme <- fitdist(serving, "weibull", method="qme", probs=c(0.25, 0.75))
summary(fWqme)
plot(fWqme)
gofstat(fWqme)


# (11) Fit of a Pareto distribution by numerical moment matching estimation
#

## Not run: 
##D     require(actuar)
##D     #simulate a sample
##D     x4 <- rpareto(1000, 6, 2)
##D 
##D     #empirical raw moment
##D     memp <- function(x, order) mean(x^order)
##D 
##D     #fit
##D     fP <- fitdist(x4, "pareto", method="mme", order=c(1, 2), memp="memp", 
##D       start=list(shape=10, scale=10), lower=1, upper=Inf)
##D     summary(fP)
##D     plot(fP)
##D 
## End(Not run)

# (12) Fit of a Weibull distribution to serving size data by maximum 
# goodness-of-fit estimation using all the distances available
# 
## Not run: 
##D data(groundbeef)
##D serving <- groundbeef$serving
##D (f1 <- fitdist(serving, "weibull", method="mge", gof="CvM"))
##D (f2 <- fitdist(serving, "weibull", method="mge", gof="KS"))
##D (f3 <- fitdist(serving, "weibull", method="mge", gof="AD"))
##D (f4 <- fitdist(serving, "weibull", method="mge", gof="ADR"))
##D (f5 <- fitdist(serving, "weibull", method="mge", gof="ADL"))
##D (f6 <- fitdist(serving, "weibull", method="mge", gof="AD2R"))
##D (f7 <- fitdist(serving, "weibull", method="mge", gof="AD2L"))
##D (f8 <- fitdist(serving, "weibull", method="mge", gof="AD2"))
##D cdfcomp(list(f1, f2, f3, f4, f5, f6, f7, f8))
##D cdfcomp(list(f1, f2, f3, f4, f5, f6, f7, f8), 
##D   xlogscale=TRUE, xlim=c(8, 250), verticals=TRUE)
##D denscomp(list(f1, f2, f3, f4, f5, f6, f7, f8))
## End(Not run)

# (13) Fit of a uniform distribution using maximum likelihood 
# (a closed formula is used in this special case where the loglikelihood is not defined),
# or maximum goodness-of-fit with Cramer-von Mises or Kolmogorov-Smirnov distance
# 

set.seed(1234)
u <- runif(50, min=5, max=10)

fumle <- fitdist(u, "unif", method="mle")
summary(fumle)
plot(fumle)
gofstat(fumle)

fuCvM <- fitdist(u, "unif", method="mge", gof="CvM")
summary(fuCvM)
plot(fuCvM)
gofstat(fuCvM)

fuKS <- fitdist(u, "unif", method="mge", gof="KS")
summary(fuKS)
plot(fuKS)
gofstat(fuKS)

# (14) scaling problem
# the simulated dataset (below) has particularly small values, hence without scaling (10^0),
# the optimization raises an error. The for loop shows how scaling by 10^i
# for i=1,...,6 makes the fitting procedure work correctly.

set.seed(1234)
x2 <- rnorm(100, 1e-4, 2e-4)

for(i in 0:6)
        cat(i, try(fitdist(x2*10^i, "cauchy", method="mle")$estimate, silent=TRUE), "\n")

# (15) Fit of a normal distribution on acute toxicity values of endosulfan in log10 for
# nonarthropod invertebrates, using maximum likelihood estimation
# to estimate what is called a species sensitivity distribution 
# (SSD) in ecotoxicology, followed by estimation of the 5 percent quantile value of 
# the fitted distribution (which is called the 5 percent hazardous concentration, HC5,
# in ecotoxicology) and estimation of other quantiles.
#
data(endosulfan)
ATV <- subset(endosulfan, group == "NonArthroInvert")$ATV
log10ATV <- log10(subset(endosulfan, group == "NonArthroInvert")$ATV)
fln <- fitdist(log10ATV, "norm")

quantile(fln, probs = 0.05)
quantile(fln, probs = c(0.05, 0.1, 0.2))


# (16) Fit of a triangular distribution using Cramer-von Mises or
# Kolmogorov-Smirnov distance
# 

## Not run: 
##D set.seed(1234)
##D require(mc2d)
##D t <- rtriang(100, min=5, mode=6, max=10)
##D fCvM <- fitdist(t, "triang", method="mge", start = list(min=4, mode=6,max=9), gof="CvM")
##D fKS <- fitdist(t, "triang", method="mge", start = list(min=4, mode=6,max=9), gof="KS")
##D cdfcomp(list(fCvM,fKS))
## End(Not run)

# (17) fit a non classical discrete distribution (the zero inflated Poisson distribution)
#
## Not run: 
##D require(gamlss.dist)
##D set.seed(1234)
##D x <- rZIP(n = 30, mu = 5, sigma = 0.2)
##D plotdist(x, discrete = TRUE)
##D fitzip <- fitdist(x, "ZIP", start =  list(mu = 4, sigma = 0.15), discrete = TRUE, 
##D   optim.method = "L-BFGS-B", lower = c(0, 0), upper = c(Inf, 1))
##D summary(fitzip)
##D plot(fitzip)
##D fitp <- fitdist(x, "pois")
##D cdfcomp(list(fitzip, fitp))
##D gofstat(list(fitzip, fitp))
## End(Not run)



# (18) examples with distributions in actuar (predefined starting values)
#
## Not run: 
##D require(actuar)
##D x <- c(2.3,0.1,2.7,2.2,0.4,2.6,0.2,1.,7.3,3.2,0.8,1.2,33.7,14.,
##D        21.4,7.7,1.,1.9,0.7,12.6,3.2,7.3,4.9,4000.,2.5,6.7,3.,63.,
##D        6.,1.6,10.1,1.2,1.5,1.2,30.,3.2,3.5,1.2,0.2,1.9,0.7,17.,
##D        2.8,4.8,1.3,3.7,0.2,1.8,2.6,5.9,2.6,6.3,1.4,0.8)
##D #log logistic
##D ft_llogis <- fitdist(x,'llogis')
##D 
##D x <- c(0.3837053, 0.8576858, 0.3552237, 0.6226119, 0.4783756, 0.3139799, 0.4051403, 
##D        0.4537631, 0.4711057, 0.5647414, 0.6479617, 0.7134207, 0.5259464, 0.5949068, 
##D        0.3509200, 0.3783077, 0.5226465, 1.0241043, 0.4384580, 1.3341520)
##D #inverse weibull
##D ft_iw <- fitdist(x,'invweibull')
## End(Not run)




