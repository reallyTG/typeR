library(dynaTree)


### Name: alcX.dynaTree
### Title: Calculate the ALC or predictive entropy statistic at the X
###   locations, or ALC at new XX predictive locations
### Aliases: alcX.dynaTree alc.dynaTree entropyX.dynaTree
### Keywords: methods

### ** Examples

## fit the model to the parabola data
n <- 100
Xp <- runif(n,-3,3)
Yp <- Xp + Xp^2 + rnorm(n, 0, .2)
rect <- c(-3,3)
out <- dynaTree(Xp, Yp, model="linear", icept="augmented")

## calculate the alcX
out <- alcX(out, rect=rect)

## to compare to analytic 
out <- alc(out, XX=out$X[,-1], rect=rect)

## plot comparison between alcX and predict-ALC
plot(out$X[,-1], out$alcX)
o <- order(out$X[,2])
lines(out$X[o,-1], out$alc[o], col=2, lty=2)

## now compare to approximate analytic
## (which writes over out$alc)
out <- alc(out, XX=out$X[,-1], rect=rect, approx=TRUE)
lines(out$X[o,-1], out$alc[o], col=3, lty=3)

## clean up
deletecloud(out)

## similarly with entropyX for classification models

## see demo("design") for more iterations and
## design under other active learning heuristics
## like ALC, and EI for optimization; also see
## demo("online") for an online learning example where
## ALC is used for retirement



