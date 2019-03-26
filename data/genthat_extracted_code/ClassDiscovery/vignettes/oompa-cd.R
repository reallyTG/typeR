### R code from vignette source 'oompa-cd.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(ClassDiscovery)


###################################################
### code chunk number 2: simu
###################################################
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)
rm(d1,d2,d3)


###################################################
### code chunk number 3: im
###################################################
getOption("SweaveHooks")[["fig"]]()
par(mfrow=c(2,1))
image(1:nrow(dd), 1:ncol(dd), dd, xlab="genes", ylab="samples", col=redgreen(64))
image(1:nrow(dd), 1:ncol(dd), dd, xlab="genes", ylab="samples", col=jetColors(64))
par(mfrow=c(1,1))


###################################################
### code chunk number 4: pear
###################################################
getOption("SweaveHooks")[["fig"]]()
pearson <- hclust(distanceMatrix(dd, "pearson"), "average")
plot(pearson)


###################################################
### code chunk number 5: spear
###################################################
getOption("SweaveHooks")[["fig"]]()
spear <- hclust(distanceMatrix(dd, "spearman"), "average")
plot(spear)


###################################################
### code chunk number 6: unc
###################################################
getOption("SweaveHooks")[["fig"]]()
unc <- hclust(distanceMatrix(dd, "uncent"), "average")
plot(unc)


###################################################
### code chunk number 7: mycol
###################################################
getOption("SweaveHooks")[["fig"]]()
myColors <- rep(c("red", "blue", "purple"), each=10)
myLabels <- paste("Sample", 1:30)
plotColoredClusters(pearson, myLabels, myColors)


###################################################
### code chunk number 8: boot
###################################################
boot <- BootstrapClusterTest(dd, cutHclust, nTimes=200, k=4, 
                             metric="pearson", method="average", 
                             verbose=FALSE)
summary(boot)


###################################################
### code chunk number 9: bootf
###################################################
getOption("SweaveHooks")[["fig"]]()
image(boot, col=blueyellow(64))


###################################################
### code chunk number 10: boot2
###################################################
getOption("SweaveHooks")[["fig"]]()
image(boot, dendrogram=pearson,col=blueyellow(64))


###################################################
### code chunk number 11: kpert
###################################################
kper <- PerturbationClusterTest(dd, cutKmeans, k=4, nTimes=100, noise=1, verbose=FALSE)
summary(kper)


###################################################
### code chunk number 12: kperf
###################################################
getOption("SweaveHooks")[["fig"]]()
image(kper, col=redgreen(128))


###################################################
### code chunk number 13: spca
###################################################
getOption("SweaveHooks")[["fig"]]()
trueClasses <- factor(rep(c("A", "B", "C"), each=10))
spca <- SamplePCA(dd, trueClasses)
plot(spca, col=c("red", "blue", "purple"))


###################################################
### code chunk number 14: spca2
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(spca, col=c("red", "blue", "purple"), which=c(1,3))


###################################################
### code chunk number 15: scree
###################################################
getOption("SweaveHooks")[["fig"]]()
screeplot(spca)


###################################################
### code chunk number 16: nd
###################################################
newdata <- matrix(rnorm(10*100), ncol=10)
projected <- predict(spca, newdata)


###################################################
### code chunk number 17: ndf
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(spca, col=c("red", "blue", "purple"))
points(projected[,1], projected[,2], pch=16)


###################################################
### code chunk number 18: mose
###################################################
mose <- Mosaic(dd, sampleMetric="spearman", geneMetric="pearson")
summary(mose)


###################################################
### code chunk number 19: fmose
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(mose, hExp=3, col=redgreen(64))


###################################################
### code chunk number 20: fmose2
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(mose, hExp=3, col=redgreen(64), scale='row', limits=2)


###################################################
### code chunk number 21: bb
###################################################
library(Biobase)
data(sample.ExpressionSet)
s <- sample.ExpressionSet
s


###################################################
### code chunk number 22: eclu
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(hclust(distanceMatrix(s, "pearson"), "average"))


###################################################
### code chunk number 23: epca
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(SamplePCA(s))


###################################################
### code chunk number 24: emos
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(Mosaic(s), hExp=3, col=blueyellow(64))


