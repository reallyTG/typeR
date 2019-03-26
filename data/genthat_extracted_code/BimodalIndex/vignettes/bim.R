### R code from vignette source 'bim.Rnw'

###################################################
### code chunk number 1: bim.Rnw:28-31
###################################################
options(width=88)
options(SweaveHooks = list(fig = function() par(bg='white')))
#if (!file.exists("Figures")) dir.create("Figures")


###################################################
### code chunk number 2: simdata
###################################################
set.seed(564684)
nSamples <- 60
nGenes <- 3000
dataset <- matrix(rnorm(nSamples*nGenes), ncol=nSamples, nrow=nGenes)
dimnames(dataset) <- list(paste("G", 1:nGenes, sep=''),
                          paste("S", 1:nSamples, sep=''))


###################################################
### code chunk number 3: shift
###################################################
dataset[1:100, 1:30] <- dataset[1:100, 1:30] + 3


###################################################
### code chunk number 4: lib
###################################################
library(BimodalIndex)


###################################################
### code chunk number 5: bim
###################################################
bim <- bimodalIndex(dataset)
summary(bim)


###################################################
### code chunk number 6: bim.Rnw:74-76
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(bim$BI, col=rep(c("red", "black"), times=c(100, 2900)),
     xlab="Gene", ylab="Bimodal Index")


###################################################
### code chunk number 7: extra
###################################################
summary(bim$BI[101:3000])
cutoffs <- quantile(bim$BI[101:3000], probs=c(0.90, 0.95, 0.99))
cutoffs


###################################################
### code chunk number 8: sensitivity
###################################################
sapply(cutoffs, function(x) sum(bim$BI[1:100] > x))


###################################################
### code chunk number 9: getwd
###################################################
getwd()


###################################################
### code chunk number 10: si
###################################################
sessionInfo()


