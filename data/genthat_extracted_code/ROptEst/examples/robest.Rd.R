library(ROptEst)


### Name: robest
### Title: Optimally robust estimation
### Aliases: robest
### Keywords: robust

### ** Examples

## Don't test to reduce check time on CRAN
## No test: 
#############################
## 1. Binomial data
#############################
## generate a sample of contaminated data
set.seed(123)
ind <- rbinom(100, size=1, prob=0.05)
x <- rbinom(100, size=25, prob=(1-ind)*0.25 + ind*0.9)

## Family
BF <- BinomFamily(size = 25)
## ML-estimate
MLest <- MLEstimator(x, BF)
estimate(MLest)
confint(MLest)

## compute optimally robust estimator (known contamination)
nb <- gennbCtrl(eps=0.05)
robest1 <- robest(x, BF, nbCtrl = nb, steps = 3)
estimate(robest1)

confint(robest1, method = symmetricBias())
## neglecting bias
confint(robest1)
plot(pIC(robest1))
tmp <- qqplot(x, robest1, cex.pch=1.5, exp.cex2.pch = -.25,
              exp.fadcol.pch = .55, jit.fac=.9)

## compute optimally robust estimator (unknown contamination)
nb2 <- gennbCtrl(eps.lower = 0, eps.upper = 0.2)
robest2 <- robest(x, BF, nbCtrl = nb2, steps = 3)
estimate(robest2)
confint(robest2, method = symmetricBias())
plot(pIC(robest2))

## total variation neighborhoods (known deviation)
nb3 <- gennbCtrl(eps = 0.025, neighbor = TotalVarNeighborhood())
robest3 <- robest(x, BF, nbCtrl = nb3, steps = 3)
estimate(robest3)
confint(robest3, method = symmetricBias())
plot(pIC(robest3))

## total variation neighborhoods (unknown deviation)
nb4 <- gennbCtrl(eps.lower = 0, eps.upper = 0.1,
                 neighbor = TotalVarNeighborhood())
robest3 <- robest(x, BF, nbCtrl = nb4, steps = 3)
robest4 <- robest(x, BinomFamily(size = 25), nbCtrl = nb4, steps = 3)
estimate(robest4)
confint(robest4, method = symmetricBias())
plot(pIC(robest4))


#############################
## 2. Poisson data
#############################
## Example: Rutherford-Geiger (1910); cf. Feller~(1968), Section VI.7 (a)
x <- c(rep(0, 57), rep(1, 203), rep(2, 383), rep(3, 525), rep(4, 532), 
       rep(5, 408), rep(6, 273), rep(7, 139), rep(8, 45), rep(9, 27), 
       rep(10, 10), rep(11, 4), rep(12, 0), rep(13, 1), rep(14, 1))

## Family
PF <- PoisFamily()

## ML-estimate
MLest <- MLEstimator(x, PF)
estimate(MLest)
confint(MLest)

## compute optimally robust estimator (unknown contamination)
nb1 <- gennbCtrl(eps.upper = 0.1)
robest <- robest(x, PF, nbCtrl = nb1, steps = 3)
estimate(robest)

confint(robest, symmetricBias())
plot(pIC(robest))
tmp <- qqplot(x, robest, cex.pch=1.5, exp.cex2.pch = -.25,
              exp.fadcol.pch = .55, jit.fac=.9)
 
## total variation neighborhoods (unknown deviation)
nb2 <- gennbCtrl(eps.upper = 0.05, neighbor = TotalVarNeighborhood())
robest1 <- robest(x, PF, nbCtrl = nb2, steps = 3)
estimate(robest1)
confint(robest1, symmetricBias())
plot(pIC(robest1))
## End(No test)

#############################
## 3. Normal (Gaussian) location and scale
#############################
## 24 determinations of copper in wholemeal flour
library(MASS)
data(chem)
plot(chem, main = "copper in wholemeal flour", pch = 20)

## Family
NF <- NormLocationScaleFamily()
## ML-estimate
MLest <- MLEstimator(chem, NF)
estimate(MLest)
confint(MLest)

## Don't run to reduce check time on CRAN
## Not run: 
##D ## compute optimally robust estimator (known contamination)
##D ## takes some time -> you can use package RobLox for normal 
##D ## location and scale which is optimized for speed
##D nb1 <- gennbCtrl(eps = 0.05)
##D robEst <- robest(chem, NF, nbCtrl = nb1, steps = 3)
##D estimate.call(robEst)
##D attr(robEst,"timings")
##D estimate(robest)
##D 
##D confint(robest, symmetricBias())
##D plot(pIC(robest))
##D ## plot of relative and absolute information; cf. Kohl (2005)
##D infoPlot(pIC(robest))
##D 
##D tmp <- qqplot(chem, robest, cex.pch=1.5, exp.cex2.pch = -.25,
##D               exp.fadcol.pch = .55, withLab = TRUE, which.Order=1:4,
##D               exp.cex2.lbl = .12,exp.fadcol.lbl = .45,
##D               nosym.pCI = TRUE, adj.lbl=c(1.7,.2),
##D               exact.pCI = FALSE, log ="xy")
##D              
##D ## finite-sample correction
##D if(require(RobLox)){
##D     n <- length(chem)
##D     r <- 0.05*sqrt(n)
##D     r.fi <- finiteSampleCorrection(n = n, r = r)
##D     fsCor0 <- r.fi/r
##D     nb1 <- gennbCtrl(eps = 0.05)
##D     robest <- robest(chem, NF, nbCtrl = nb1, fsCor = fsCor0, steps = 3)
##D     estimate(robest)
##D }
##D 
##D ## compute optimally robust estimator (unknown contamination)
##D ## takes some time -> use package RobLox!
##D nb2 <- gennbCtrl(eps.lower = 0.05, eps.upper = 0.1)
##D robest1 <- robest(chem, NF, nbCtrl = nb2, steps = 3)
##D estimate(robest1)
##D confint(robest1, symmetricBias())
##D plot(pIC(robest1))
##D ## plot of relative and absolute information; cf. Kohl (2005)
##D infoPlot(pIC(robest1))
## End(Not run)



