library(secr)


### Name: empirical.varD
### Title: Empirical Variance of H-T Density Estimate
### Aliases: empirical.varD derivednj derivedSession derivedMash
###   derivedCluster derivedExternal
### Keywords: models

### ** Examples


## The `ovensong' data are pooled from 75 replicate positions of a
## 4-microphone array. The array positions are coded as the first 4
## digits of each sound identifier. The sound data are initially in the
## object `signalCH'. We first impose a 52.5 dB signal threshold as in
## Dawson & Efford (2009, J. Appl. Ecol. 46:1201--1209). The vector nj
## includes 33 positions at which no ovenbird was heard. The first and
## second columns of `temp' hold the estimated effective sampling area
## and its standard error.

signalCH.525 <- subset(signalCH, cutval = 52.5)
nonzero.counts <- table(substring(rownames(signalCH.525),1,4))
nj <- c(nonzero.counts, rep(0, 75 - length(nonzero.counts)))
temp <- derived(ovensong.model.1, se.esa = TRUE)
derivednj(nj, temp["esa",1:2])

## The result is very close to that reported by Dawson & Efford
## from a 2-D Poisson model fitted by maximizing the full likelihood.

## If nj vector has length 1, a theoretical variance is used...
msk <- ovensong.model.1$mask
A <- nrow(msk) * attr(msk, "area")
derivednj (sum(nj), temp["esa",1:2], method = "poisson")
derivednj (sum(nj), temp["esa",1:2], method = "binomial", area = A)

## Not run: 
##D 
##D ## Set up an array of small (4 x 4) grids,
##D ## simulate a Poisson-distributed population,
##D ## sample from it, plot, and fit a model.
##D ## mash() condenses clusters to a single cluster
##D 
##D testregion <- data.frame(x = c(0,2000,2000,0),
##D     y = c(0,0,2000,2000))
##D t4 <- make.grid(nx = 4, ny = 4, spacing = 40)
##D t4.16 <- make.systematic (n = 16, cluster = t4,
##D     region = testregion)
##D popn1 <- sim.popn (D = 5, core = testregion,
##D     buffer = 0)
##D capt1 <- sim.capthist(t4.16, popn = popn1)
##D fit1 <- secr.fit(mash(capt1), CL = TRUE, trace = FALSE)
##D 
##D ## Visualize sampling
##D tempmask <- make.mask(t4.16, spacing = 10, type =
##D     "clusterbuffer")
##D plot(tempmask)
##D plot(t4.16, add = TRUE)
##D plot(capt1, add = TRUE)
##D 
##D ## Compare model-based and empirical variances.
##D ## Here the answers are similar because the data
##D ## were simulated from a Poisson distribution,
##D ## as assumed by \code{derived}
##D 
##D derived(fit1)
##D derivedMash(fit1)
##D 
##D ## Now simulate a patchy distribution; note the
##D ## larger (and more credible) SE from derivedMash().
##D 
##D popn2 <- sim.popn (D = 5, core = testregion, buffer = 0,
##D     model2D = "hills", details = list(hills = c(-2,3)))
##D capt2 <- sim.capthist(t4.16, popn = popn2)
##D fit2 <- secr.fit(mash(capt2), CL = TRUE, trace = FALSE)
##D derived(fit2)
##D derivedMash(fit2)
##D 
##D ## The detection model we have fitted may be extrapolated to
##D ## a more fine-grained systematic sample of points, with
##D ## detectors operated on a single occasion at each...
##D ## Total effort 400 x 1 = 400 detector-occasions, compared
##D ## to 256 x 5 = 1280 detector-occasions for initial survey.
##D 
##D t1 <- make.grid(nx = 1, ny = 1)
##D t1.100 <- make.systematic (cluster = t1, spacing = 100,
##D     region = testregion)
##D capt2a <- sim.capthist(t1.100, popn = popn2, noccasions = 1)
##D ## one way to get number of animals per point
##D nj <- attr(mash(capt2a), "n.mash")
##D derivedExternal (fit2, nj = nj, cluster = t1, buffer = 100,
##D     noccasions = 1)
##D 
##D ## Review plots
##D library(MASS)
##D base.plot <- function() {
##D     eqscplot( testregion, axes = FALSE, xlab = "",
##D         ylab = "", type = "n")
##D     polygon(testregion)
##D }
##D par(mfrow = c(1,3), xpd = TRUE, xaxs = "i", yaxs = "i")
##D base.plot()
##D plot(popn2, add = TRUE, col = "blue")
##D mtext(side=3, line=0.5, "Population", cex=0.8, col="black")
##D base.plot()
##D plot (capt2a, add = TRUE,title = "Extensive survey")
##D base.plot()
##D plot(capt2, add = TRUE, title = "Intensive survey")
##D par(mfrow = c(1,1), xpd = FALSE, xaxs = "r", yaxs = "r")  ## defaults
## End(Not run)




