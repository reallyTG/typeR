## ---- eval=TRUE----------------------------------------------------------
suppressWarnings(library(hisse))
phy <- read.tree("whales_Steemanetal2009.tre")

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1)
#  eps <- c(1)
#  one.rate <- MiSSE(phy, f=1, turnover=turnover, eps=eps)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2)
#  eps <- c(1,1)
#  two.rate <- MiSSE(phy, f=1, turnover=turnover, eps=eps)

## ---- eval=FALSE---------------------------------------------------------
#  #rate classes A:C
#  turnover <- c(1,2,3)
#  eps <- c(1,1,1)
#  three.rate <- MiSSE(phy, f=1, turnover=turnover, eps=eps)
#  #rate classes A:D
#  turnover <- c(1,2,3,4)
#  eps <- c(1,1,1,1)
#  four.rate <- MiSSE(phy, f=1, turnover=turnover, eps=eps)
#  #rate classes A:E
#  turnover <- c(1,2,3,4,5)
#  eps <- c(1,1,1,1,1)
#  five.rate <- MiSSE(phy, f=1, turnover=turnover, eps=eps)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2)
#  eps <- c(1,2)
#  two.rate.weps <- MiSSE(phy, f=1, turnover=turnover, eps=eps)
#  
#  #rate classes A:C, but include eps as well:
#  turnover <- c(1,2,3)
#  eps <- c(1,2,3)
#  three.rate.weps <- MiSSE(phy, f=1, turnover=turnover, eps=eps)

## ---- eval=TRUE, echo=FALSE, fig.cap = "The fit of an incremental increase in the number of rate classes estimated under a MiSSE analysis of the cetacean phylogeny of Steeman et al. (2009). There is a clear reduction in AIC from one to three rate classes, which levels off at four rate classes and five rate classes returns an AIC that is about 1 unit higher than either the three and four rate class."----
load("misse.vignette.Rsave")
model.fits <- c(one.rate$AIC, two.rate$AIC, three.rate$AIC, four.rate$AIC, five.rate$AIC)
plot(x=1:5, y=model.fits, bty="n", xlab="", ylab="", type="l", axes=FALSE, xlim=c(1,5.0), ylim=c(530,560))
title(xlab=c("Models"), line=2)
title(ylab=c("AIC"), line=2.5)
par(tck=.01)
axis(2, at = seq(530, 560, by = 5), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(1, 5, by = 1), las =1, lwd=1, labels=c("One Rate", "Two Rate", "Three Rate", "Four Rate", "Five Rate"), mgp=c(.75,.5,0))

## ---- eval=TRUE----------------------------------------------------------
# two.rate.recon <- MarginReconMiSSE(phy=phy, f=1,  hidden.states=2, 
                #pars=two.rate$solution, n.cores=3, aic=two.rate$AIC)
load("misse.vignette.Rsave") # Line above shows the command to create this result.
class(two.rate.recon)
two.rate.recon

## ---- eval=FALSE---------------------------------------------------------
#  plot.misse.states(two.rate.recon, rate.param="net.div", show.tip.label=TRUE, type="phylogram",
#                    fsize=.25, legend="none")

## ---- eval=TRUE, echo=FALSE, fig.cap = "A two-rate class MiSSE analysis and reconstruction of the cetacean phylogeny of Steeman et al. (2009) shows a clear increase in the net diversification rate within the Delphinidae (dolphins) relative to all other cetaceans; there also seems to be a slightly elevated rates in the sister group of Delphinidae, the Monodontidae+Phocenidae. Overall, this particular MiSSE model seems to correctly identify the source of 'trait-independent' diversification that can plague BiSSE analyses of simulated data sets on the cetacean tree (see Rabosky and Goldberg, 2015)."----
plot.misse.states(two.rate.recon, rate.param="net.div", show.tip.label=TRUE, type="phylogram",
                  fsize=.25, legend="none")

## ---- eval=TRUE----------------------------------------------------------
misse.results.list = list()
misse.results.list[[1]] = one.rate.recon
misse.results.list[[2]] = two.rate.recon
misse.results.list[[3]] = three.rate.recon
misse.results.list[[4]] = four.rate.recon
misse.results.list[[5]] = five.rate.recon

## ---- eval=FALSE---------------------------------------------------------
#  plot.misse.states(misse.results.list, rate.param="net.div", show.tip.label=TRUE, type="phylogram",
#                    fsize=.25, legend="none")

## ---- eval=TRUE, echo=FALSE, fig.cap = "A model-averaged MiSSE analysis of the cetacean phylogeny of Steeman et al. (2009) shows an apparent slow down in the net diversification through time."----
plot.misse.states(misse.results.list, rate.param="net.div", show.tip.label=TRUE, type="phylogram",
                  fsize=.25, legend="none")

## ---- eval=TRUE----------------------------------------------------------
two.rate
three.rate

## ---- eval=TRUE----------------------------------------------------------
expected.transitions.two <- 0.004 * sum(two.rate$phy$edge.length)
expected.transitions.two
expected.transitions.three <- 0.131 * sum(three.rate$phy$edge.length)
expected.transitions.three

## ---- eval=TRUE----------------------------------------------------------
load("misse.support.Rsave")
two.rate.support$ci[,"q0"]
three.rate.support$ci[,"q0"]

