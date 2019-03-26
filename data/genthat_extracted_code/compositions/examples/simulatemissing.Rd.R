library(compositions)


### Name: simulatemissings
### Title: Artifical simulation of various kinds of missings/polluted data
### Aliases: simulateMissings observeWithAdditiveError
###   observeWithDetectionLimit observeWithDetectionlimit
### Keywords: datagen

### ** Examples

data(SimulatedAmounts)
x <- acomp(sa.lognormals)
xnew <- simulateMissings(x,dl=0.05,MAR=0.05,MNAR=0.05,SZ=0.05)
acomp(xnew)
plot(missingSummary(xnew))



