library(lpdensity)


### Name: lpdensity.plot
### Title: Local Polynomial Density Plot with Robust Confidence Intervals
### Aliases: lpdensity.plot

### ** Examples

set.seed(42); X <- rnorm(2000)

X <- X - 0.5; X[X>0] <- X[X>0] * 2
est1 <- lpdensity(data = X[X<=0], grid = seq(-2.5, 0, 0.05), bwselect = "IMSE",
  scale = sum(X<=0)/length(X))
est2 <- lpdensity(data = X[X>0],  grid = seq(0, 2, 0.05), bwselect = "IMSE",
  scale = sum(X>0)/length(X))
lpdensity.plot(est1, est2, legendTitle="My Plot", legendGroups=c("Left", "Right"))




