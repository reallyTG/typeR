library(quantreg)


### Name: predict.rqss
### Title: Predict from fitted nonparametric quantile regression smoothing
###   spline models
### Aliases: predict.rqss predict.qss1 predict.qss2
### Keywords: regression smooth robust

### ** Examples

n <- 200
lam <- 2
x <- sort(rchisq(n,4))
z <- exp(rnorm(n)) + x
y <- log(x)+ .1*(log(x))^2 + z/4 +  log(x)*rnorm(n)/4
plot(x,y - z/4 + mean(z)/4)
Ifit <- rqss(y ~ qss(x,constraint="I") + z)
sfit <- rqss(y ~ qss(x,lambda = lam) + z)
xz <- data.frame(z = mean(z),
                 x = seq(min(x)+.01,max(x)-.01,by=.25))
lines(xz[["x"]], predict(Ifit, xz), col=2)
lines(xz[["x"]], predict(sfit, xz), col=3)
legend(10,2,c("Increasing","Smooth"),lty = 1, col = c(2,3))
title("Predicted Median Response at Mean Value of z")

## Bivariate example -- loads pkg "tripack"
require(tripack)
require(akima)
data(CobarOre)
fit <- rqss(z ~ qss(cbind(x,y), lambda=.08),
            data= CobarOre)
plot(fit, col="grey",
     main = "CobarOre data -- rqss(z ~ qss(cbind(x,y)))")
T <- with(CobarOre, tri.mesh(x, y))
set.seed(77)
ndum <- 100
xd <- with(CobarOre, runif(ndum, min(x), max(x)))
yd <- with(CobarOre, runif(ndum, min(y), max(y)))
table(s <- in.convex.hull(T, xd, yd))
pred <- predict(fit, data.frame(x = xd[s], y = yd[s]))
contour(interp(xd[s],yd[s], pred),
        col="red", add = TRUE)



