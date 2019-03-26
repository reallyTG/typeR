library(dynaTree)


### Name: retire.dynaTree
### Title: Retire (i.e. remove) data from the a dynaTree model
### Aliases: retire.dynaTree
### Keywords: methods

### ** Examples

n <- 100
Xp <- runif(n,-3,3)
XX <- seq(-3,3, length=200)
Yp <- Xp + Xp^2 + rnorm(n, 0, .2)
rect <- c(-3,3)
out <- dynaTree(Xp, Yp, model="linear", icept="augmented")

## predict and plot
out <- predict(out, XX)
plot(out, main="parabola data", lwd=2)

## randomly remove half of the data points
out <- retire(out, sample(1:n, n/2, replace=FALSE))

## predict and add to plot -- shouldn't change anything
out <- predict(out, XX)
plot(out, add=TRUE, col=3)
points(out$X[,-1], out$y, col=3)

## now illustrating rejuvenation, which should result
## in a change to the predictive surface
out <- rejuvenate(out)
out <- predict(out, XX)
plot(out, add=TRUE, col=4)
legend("top", c("original", "retired", "rejuvenated"),
       col=2:4, lty=1)

## clean up
deletecloud(out)

## see demo("online") for an online learning example
## where ALC is used for retirement



