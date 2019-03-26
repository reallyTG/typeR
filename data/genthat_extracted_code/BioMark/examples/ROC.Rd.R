library(BioMark)


### Name: ROC
### Title: ROC curves
### Aliases: ROC print.ROC plot.ROC lines.ROC points.ROC identify.ROC
###   ROC.default roc.value AUC
### Keywords: classif

### ** Examples

data(spikedApples)
apple.coef <- get.biom(X = spikedApples$dataMatrix,
                       Y = rep(1:2, each = 10),
                       fmethod = "vip",
                       ncomp = 3, type = "coef")

## ROC curve for all VIP values, ordered according to size
true.biom <- (1:ncol(spikedApples$dataMatrix) %in% spikedApples$biom)
vip.roc <- ROC(apple.coef$vip, true.biom)
plot(vip.roc)

## Add stability-based selection point
apple.stab <- get.biom(X = spikedApples$dataMatrix,
                       Y = rep(1:2, each = 10),
                       fmethod = "vip",
                       ncomp = 3, type = "stab")
stab.roc <- roc.value(apple.stab$vip[[1]]$biom.indices,
                      spikedApples$biom,
                      totalN = ncol(spikedApples$dataMatrix))
points(stab.roc, col = "red", pch = 19, cex = 1.5)

## Not run: 
##D ## Add HC-based selection point
##D ## Attention: takes approx. 2 minutes on my PC
##D apple.HC <- get.biom(X = spikedApples$dataMatrix,
##D                      Y = rep(1:2, each = 10),
##D                      fmethod = "vip",
##D                      ncomp = 3, type = "HC")
##D HC.roc <- roc.value(apple.HC$vip$biom.indices,
##D                     spikedApples$biom,
##D                     totalN = ncol(spikedApples$dataMatrix))
##D points(HC.roc, col = "blue", pch = 19, cex = 1.5)
## End(Not run)



