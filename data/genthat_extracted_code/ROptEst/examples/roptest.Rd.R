library(ROptEst)


### Name: roptest
### Title: Optimally robust estimation
### Aliases: roptest roptest.old
### Keywords: robust

### ** Examples

## Don't run to reduce check time on CRAN
## Not run: 
##D #############################
##D ## 1. Binomial data
##D #############################
##D ## generate a sample of contaminated data
##D set.seed(123)
##D ind <- rbinom(100, size=1, prob=0.05)
##D x <- rbinom(100, size=25, prob=(1-ind)*0.25 + ind*0.9)
##D 
##D ## ML-estimate
##D MLest <- MLEstimator(x, BinomFamily(size = 25))
##D estimate(MLest)
##D confint(MLest)
##D 
##D ## compute optimally robust estimator (known contamination)
##D robest1 <- roptest(x, BinomFamily(size = 25), eps = 0.05, steps = 3)
##D robest1.0 <- roptest.old(x, BinomFamily(size = 25), eps = 0.05, steps = 3)
##D identical(robest1,robest1.0)
##D estimate(robest1)
##D confint(robest1, method = symmetricBias())
##D ## neglecting bias
##D confint(robest1)
##D plot(pIC(robest1))
##D tmp <- qqplot(x, robest1, cex.pch=1.5, exp.cex2.pch = -.25,
##D               exp.fadcol.pch = .55, jit.fac=.9)
##D 
##D ## compute optimally robust estimator (unknown contamination)
##D robest2 <- roptest(x, BinomFamily(size = 25), eps.lower = 0, eps.upper = 0.2, steps = 3)
##D estimate(robest2)
##D confint(robest2, method = symmetricBias())
##D plot(pIC(robest2))
##D 
##D ## total variation neighborhoods (known deviation)
##D robest3 <- roptest(x, BinomFamily(size = 25), eps = 0.025, 
##D                    neighbor = TotalVarNeighborhood(), steps = 3)
##D estimate(robest3)
##D confint(robest3, method = symmetricBias())
##D plot(pIC(robest3))
##D 
##D ## total variation neighborhoods (unknown deviation)
##D robest4 <- roptest(x, BinomFamily(size = 25), eps.lower = 0, eps.upper = 0.1, 
##D                    neighbor = TotalVarNeighborhood(), steps = 3)
##D estimate(robest4)
##D confint(robest4, method = symmetricBias())
##D plot(pIC(robest4))
##D 
##D #############################
##D ## 2. Poisson data
##D #############################
##D ## Example: Rutherford-Geiger (1910); cf. Feller~(1968), Section VI.7 (a)
##D x <- c(rep(0, 57), rep(1, 203), rep(2, 383), rep(3, 525), rep(4, 532), 
##D        rep(5, 408), rep(6, 273), rep(7, 139), rep(8, 45), rep(9, 27), 
##D        rep(10, 10), rep(11, 4), rep(12, 0), rep(13, 1), rep(14, 1))
##D 
##D ## ML-estimate
##D MLest <- MLEstimator(x, PoisFamily())
##D estimate(MLest)
##D confint(MLest)
##D 
##D ## compute optimally robust estimator (unknown contamination)
##D robest <- roptest(x, PoisFamily(), eps.upper = 0.1, steps = 3)
##D estimate(robest)
##D confint(robest, symmetricBias())
##D 
##D plot(pIC(robest))
##D tmp <- qqplot(x, robest, cex.pch=1.5, exp.cex2.pch = -.25,
##D               exp.fadcol.pch = .55, jit.fac=.9)
##D  
##D ## total variation neighborhoods (unknown deviation)
##D robest1 <- roptest(x, PoisFamily(), eps.upper = 0.05, 
##D                   neighbor = TotalVarNeighborhood(), steps = 3)
##D estimate(robest1)
##D confint(robest1, symmetricBias())
##D plot(pIC(robest1))
## End(Not run)

#############################
## 3. Normal (Gaussian) location and scale
#############################
## 24 determinations of copper in wholemeal flour
library(MASS)
data(chem)
plot(chem, main = "copper in wholemeal flour", pch = 20)

## ML-estimate
MLest <- MLEstimator(chem, NormLocationScaleFamily())
estimate(MLest)
confint(MLest)

## Don't run to reduce check time on CRAN
## No test: 
## compute optimally robust estimator (known contamination)
## takes some time -> you can use package RobLox for normal 
## location and scale which is optimized for speed
robest <- roptest(chem, NormLocationScaleFamily(), eps = 0.05, steps = 3)
estimate(robest)
confint(robest, symmetricBias())
plot(pIC(robest))
## plot of relative and absolute information; cf. Kohl (2005)
infoPlot(pIC(robest))

tmp <- qqplot(chem, robest, cex.pch=1.5, exp.cex2.pch = -.25,
              exp.fadcol.pch = .55, withLab = TRUE, which.Order=1:4,
              exp.cex2.lbl = .12,exp.fadcol.lbl = .45,
              nosym.pCI = TRUE, adj.lbl=c(1.7,.2),
              exact.pCI = FALSE, log ="xy")

## finite-sample correction
if(require(RobLox)){
    n <- length(chem)
    r <- 0.05*sqrt(n)
    r.fi <- finiteSampleCorrection(n = n, r = r)
    fsCor <- r.fi/r
    robest <- roptest(chem, NormLocationScaleFamily(), eps = 0.05, 
                      fsCor = fsCor, steps = 3)
    estimate(robest)
}

## compute optimally robust estimator (unknown contamination)
## takes some time -> use package RobLox!
robest1 <- roptest(chem, NormLocationScaleFamily(), eps.lower = 0.05, 
                   eps.upper = 0.1, steps = 3)
estimate(robest1)
confint(robest1, symmetricBias())
plot(pIC(robest1))
## plot of relative and absolute information; cf. Kohl (2005)
infoPlot(pIC(robest1))
## End(No test)



