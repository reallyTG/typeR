## ------------------------------------------------------------------------
library(motmot.2.0, quietly=T)

## ------------------------------------------------------------------------
data(anolis.tree)
data(anolis.data)

names(anolis.data)
attach(anolis.data)
anolis.tree

## ------------------------------------------------------------------------
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
any(is.na(male.length[,1]))

## ------------------------------------------------------------------------
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait

## ------------------------------------------------------------------------
name.check(phy, male.length)

## ----plot1, fig.cap = "traitData showing the realtive male snout ventral length at the tips", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
traitData.plot(y=male.length, phy)

## ----plot2, fig.cap = "the subset of the tree", echo = T, fig.height = 7, fig.width = 7, fig.path='figures/', dev=c('png', 'pdf')----
plot(phy, show.tip.label=F, no.margin=T, edge.col="grey20")
nodelabels(182, 182, bg="black", col="white")
phy.clade <- extract.clade(phy, 182)
male.length.clade <- as.matrix(male.length[match(phy.clade$tip.label, rownames(male.length)),])

## ------------------------------------------------------------------------
bm.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="bm")
bm.ml

## ------------------------------------------------------------------------
lambda.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="lambda")
lambda.ml

## ----plot3, fig.cap = "profile plot of ML estimation for Pagel's lambda", echo = T, fig.height = 5, fig.width = 5, , fig.path='figures/', dev=c('png', 'pdf')----
lambda.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="lambda", profilePlot=T)

## ------------------------------------------------------------------------
p.value <- 1 - pchisq(lambda.ml$MaximumLikelihood - bm.ml$logLikelihood, 1)
p.value

## ------------------------------------------------------------------------
bm.ml$AICc- lambda.ml$AICc

## ----plot4, fig.cap = "profile plot to estimate delta", echo = T, fig.height = 5, fig.width = 5, , fig.path='figures/', dev=c('png', 'pdf')----
delta.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="delta", profilePlot=T)
delta.ml

## ----plot5, fig.cap = "profile plot to estimate kappa", echo = T, fig.height = 5, fig.width = 5, , fig.path='figures/', dev=c('png', 'pdf')----
kappa.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="kappa", profilePlot=T)

## ----plot6, fig.cap = "profile plot to estimate alpha", echo = T, fig.height = 5, fig.width = 5, , fig.path='figures/', dev=c('png', 'pdf')----
ou.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="OU", profilePlot=T)
ou.ml

## ----plot7, fig.cap = "profile plot to estimate the ACDC parameter", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
acdc.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="ACDC", profilePlot=T)
acdc.ml

## ------------------------------------------------------------------------
p.value.2 <- 1 - pchisq(acdc.ml$MaximumLikelihood - bm.ml$logLikelihood , 1)
p.value.2

## ------------------------------------------------------------------------
acdc.ml.lambda <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="ACDC", lambdaEst=T)
# original ACDC model
acdc.ml
# ACDC model plus lambda
acdc.ml.lambda

## ------------------------------------------------------------------------
# p value of the ACDC and ACDC+lambda models. No significant improvement
1 - pchisq(acdc.ml.lambda$MaximumLikelihood - acdc.ml$MaximumLikelihood , df=1)
# p value of the BM and ACDC+lambda model comparison. No significant improvement
1 - pchisq(acdc.ml.lambda$MaximumLikelihood - bm.ml$logLikelihood, df=2)

## ----plot8, fig.cap = "lineages with different rates of evolution", echo = T, fig.height = 5, fig.width = 5, , fig.path='figures/', dev=c('png', 'pdf')----
plot(phy.clade, show.tip.label=F, no.margin=T, edge.col="grey20")
nodelabels(c(32, 49), c(32, 49), bg="black", col="white")

## ------------------------------------------------------------------------
cladeRate.ml <- transformPhylo.ML(phy=phy.clade, y=male.length.clade, model="clade", nodeIDs=c(32, 49))
cladeRate.ml

## ------------------------------------------------------------------------
# not run
# tm1.ml <- transformPhylo.ML(y=male.length.clade, phy=phy.clade, model="tm1", minCladeSize=2, nSplits=3)
# trait.medusa.tm1.summary <- traitMedusaSummary(tm1.ml, cutoff=2, AICc=T)
tm2.ml <- transformPhylo.ML(y=male.length.clade, phy=phy.clade, model="tm2", minCladeSize=5, nSplits=2)

## ----plot9, fig.cap = "the subset of the tree", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
trait.medusa.tm2.summary <- traitMedusaSummary(tm2.ml, cutoff=2, AICc=T)
trait.medusa.tm2.summary
colour_motmot <- plotPhylo.motmot(phy=phy.clade, traitMedusaObject=trait.medusa.tm2.summary, reconType = "rates", type = "fan", cex=0.5, edge.width=2)

## ------------------------------------------------------------------------
# not run
# sim.bm <- transformPhylo.sim(phy=phy.clade, n=1000, model="bm")
# aic.cut.off <- apply(sim.bm, 2, function(x) {
	# bm.test <- transformPhylo.ML(y=as.matrix(x), phy=phy.clade, model="tm2", minCladeSize=2, nSplits=1)
	# bm.test[[1]][,"AICc"]
	# })
# tm2.cut.off <- quantile(aic.cut.off[1,] - aic.cut.off[2,], 0.95)

## ------------------------------------------------------------------------
timeSlice.10.ml <- transformPhylo.ML(y=male.length.clade, phy=phy.clade, model="timeSlice", splitTime=c(10))

## ----plot10, fig.cap = "timeSlice plot", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
outputSummary <- timeSliceSummary(timeSlice.10.ml, cutoff=0.001, cex.tip=0.2, phylo.width=2, colour.ramp=c("blue", "red"))

## ------------------------------------------------------------------------
outputSummary$RatesCI

## ------------------------------------------------------------------------
timeSlice.ml <- transformPhylo.ML(y=male.length.clade, phy=phy.clade, model="timeSlice", nSplits=2, boundaryAge=8)

## ----plot11, fig.cap = "timeSlice plot", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
outputSummary <- timeSliceSummary(timeSlice.ml, cutoff=1, cex.tip=0.2, phylo.width=2, colour.ramp=c("blue", "red"))

## ------------------------------------------------------------------------
bm.model <- transformPhylo.ML(male.length.clade, phy=phy.clade, model="bm")
nested.acdc <- transformPhylo.ML(male.length.clade, phy=phy.clade, model="ACDC", nodeIDs=c(44))
nested.ou <- transformPhylo.ML(male.length.clade, phy=phy.clade, model="OU", nodeIDs=c(44))

1 - pchisq(nested.acdc$MaximumLikelihood - bm.model$logLikelihood, 1)
1 - pchisq(nested.ou$MaximumLikelihood - bm.model$logLikelihood, 1)

## ---- results="hide"-----------------------------------------------------
set.seed(20) # set seed so run will be identical - for example use only
lambda.mcmc <- transformPhylo.MCMC(y=male.length.clade, phy=phy.clade, model="lambda", mcmc.iteration=1000, burn.in=0.1, random.start=FALSE)

## ------------------------------------------------------------------------
lambda.mcmc[1:4]

## ----plot12, fig.cap = "MCMC trace for Pagel's lambda", echo = T, fig.height = 5, fig.width = 5, fig.path='figures/', dev=c('png', 'pdf')----
plot(lambda.mcmc$mcmc.chain, type="l", ylim=c(0, 1), xlab="generations", ylab="lambda", las=1)

