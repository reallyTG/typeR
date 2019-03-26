library(BioMark)


### Name: traceplot
### Title: Plot the coefficient or stability trace for the lasso/elastic
###   net biomarker selection.
### Aliases: traceplot
### Keywords: multivariate models

### ** Examples

library(BioMark)
data(spikedApples)

mycols <- rep("gray", ncol(spikedApples$dataMatrix))
mycols[spikedApples$biom] <- "red"
myltys <- rep(2, ncol(spikedApples$dataMatrix))
myltys[spikedApples$biom] <- 1

par(mfrow = c(1,2))
apple.coef <- get.biom(X = spikedApples$dataMatrix,
                       Y = factor(rep(0:1, each = 10)),
                       ncomp = 2:3, type = "coef")
traceplot(apple.coef, col = mycols, lty = myltys)

apple.stab <- get.biom(X = spikedApples$dataMatrix,
                       Y = factor(rep(0:1, each = 10)),
                       fmethod = c("vip","lasso"), type = "stab")
traceplot(apple.stab, col = mycols, lty = myltys)



