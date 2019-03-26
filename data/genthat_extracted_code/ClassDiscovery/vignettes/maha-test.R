### R code from vignette source 'maha-test.Rnw'

###################################################
### code chunk number 1: maha-test.Rnw:29-32
###################################################
options(width=88)
options(SweaveHooks = list(fig = function() par(bg='white')))
#if (!file.exists("Figures")) dir.create("Figures")


###################################################
### code chunk number 2: simdata
###################################################
set.seed(564684)
nSamples <- 30
nGenes <- 3000
dataset <- matrix(rnorm(nSamples*nGenes), ncol=nSamples, nrow=nGenes)
dimnames(dataset) <- list(paste("G", 1:nGenes, sep=''),
                          paste("S", 1:nSamples, sep=''))


###################################################
### code chunk number 3: liars
###################################################
nShift <- 300
affected <- sample(nGenes, nShift)
dataset[affected,1] <- dataset[affected,1] + rnorm(nShift, 1, 1)
dataset[affected,2] <- dataset[affected,2] + rnorm(nShift, 1, 1)


###################################################
### code chunk number 4: spca
###################################################
library(ClassDiscovery)
spca <- SamplePCA(dataset)


###################################################
### code chunk number 5: maha-test.Rnw:68-69
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(spca)


###################################################
### code chunk number 6: pc
###################################################
round(cumsum(spca@variances)/sum(spca@variances), digits=2)


###################################################
### code chunk number 7: maah20
###################################################
maha2 <- mahalanobisQC(spca, 2)
maha5 <- mahalanobisQC(spca, 5)
maha10 <- mahalanobisQC(spca, 10)
maha20 <- mahalanobisQC(spca, 20)
myd <- data.frame(maha2, maha5, maha10, maha20)
colnames(myd) <- paste("N", rep(c(2, 5, 10, 20), each=2),
                      rep(c(".statistic", ".p.value"), 4), sep='')


###################################################
### code chunk number 8: maha-test.Rnw:101-109
###################################################
library(xtable)
xtable(myd, digits=c(0, rep(c(1, 4),4)), 
       align=paste("|l|",paste(rep("r",8), collapse=''),"|",sep=''), 
       label="maha", 
       caption=paste("Mahalanobis distance (with unadjusted p-values)",
         "of each sample from the center of",
         "N-dimensional principal component space."))
       


###################################################
### code chunk number 9: spca
###################################################
reduced <- dataset[,-1]
dim(reduced)
spca <- SamplePCA(reduced)
round(cumsum(spca@variances)/sum(spca@variances), digits=2)


###################################################
### code chunk number 10: maha-test.Rnw:131-132
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(spca)


###################################################
### code chunk number 11: redmaha
###################################################
maha20 <- mahalanobisQC(spca, 20)


###################################################
### code chunk number 12: maha-test.Rnw:145-151
###################################################
xtable(maha20, digits=c(0, 1, 4), 
       align="|l|rr|",
       label="maha2", 
       caption=paste("Mahalanobis distance (with unadjusted p-values)",
         "of each sample from the center of",
         "20-dimensional principal component space."))


###################################################
### code chunk number 13: spca
###################################################
red2 <- reduced[,-1]
dim(red2)
spca <- SamplePCA(red2)
round(cumsum(spca@variances)/sum(spca@variances), digits=2)


###################################################
### code chunk number 14: maha-test.Rnw:165-166
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(spca)


###################################################
### code chunk number 15: redmaha
###################################################
maha20 <- mahalanobisQC(spca, 20)


###################################################
### code chunk number 16: maha-test.Rnw:178-184
###################################################
xtable(maha20, digits=c(0, 1, 4), 
       align="|l|rr|",
       label="maha3", 
       caption=paste("Mahalanobis distance (with unadjusted p-values)",
         "of each sample from the center of",
         "20-dimensional principal component space."))


###################################################
### code chunk number 17: getwd
###################################################
getwd()


###################################################
### code chunk number 18: si
###################################################
sessionInfo()


