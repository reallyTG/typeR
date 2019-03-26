library(mosum)


### Name: multiscale.localPrune
### Title: Multiscale MOSUM algorithm with localised pruning
### Aliases: multiscale.localPrune

### ** Examples

x <- testData(model='mix')
mlp <- multiscale.localPrune(x, G=c(8, 15, 30, 70), do.confint=TRUE)
print(mlp)
summary(mlp)
par(mfcol=c(2, 1), mar=c(2, 4, 2, 2))
plot.ts(x)
abline(v=mlp$cpts, col=2)
plot(mlp)



