library(partykit)


### Name: cforest
### Title: Conditional Random Forests
### Aliases: cforest gettree gettree.cforest predict.cforest
### Keywords: tree

### ** Examples

## basic example: conditional inference forest for cars data
cf <- cforest(dist ~ speed, data = cars)

## prediction of fitted mean and visualization
nd <- data.frame(speed = 4:25)
nd$mean  <- predict(cf, newdata = nd, type = "response")
plot(dist ~ speed, data = cars)
lines(mean ~ speed, data = nd)

## predict quantiles (aka quantile regression forest)
myquantile <- function(y, w) quantile(rep(y, w), probs = c(0.1, 0.5, 0.9))
p <- predict(cf, newdata = nd, type = "response", FUN = myquantile)
colnames(p) <- c("lower", "median", "upper")
nd <- cbind(nd, p)

## visualization with conditional (on speed) prediction intervals
plot(dist ~ speed, data = cars, type = "n")
with(nd, polygon(c(speed, rev(speed)), c(lower, rev(upper)),
  col = "lightgray", border = "transparent"))
points(dist ~ speed, data = cars)
lines(mean ~ speed, data = nd, lwd = 1.5)
lines(median ~ speed, data = nd, lty = 2, lwd = 1.5)
legend("topleft", c("mean", "median", "10% - 90% quantile"),
  lwd = c(1.5, 1.5, 10), lty = c(1, 2, 1),
  col = c("black", "black", "lightgray"), bty = "n")

### we may also use predicted conditional (on speed) densities
mydensity <- function (y, w) approxfun(density(y, weights = w/sum(w))[1:2], rule = 2)
pd <- predict(cf, newdata = nd, type = "response", FUN = mydensity)

## visualization in heatmap (instead of scatterplot)
## with fitted curves as above
dist <- -10:150
dens <- t(sapply(seq_along(pd), function(i) pd[[i]](dist)))
image(nd$speed, dist, dens, xlab = "speed", col = rev(gray.colors(9)))
lines(mean ~ speed, data = nd, lwd = 1.5)
lines(median ~ speed, data = nd, lty = 2, lwd = 1.5)
lines(lower ~ speed, data = nd, lty = 2)
lines(upper ~ speed, data = nd, lty = 2)

## Not run: 
##D 
##D ### honest (i.e., out-of-bag) cross-classification of
##D ### true vs. predicted classes
##D data("mammoexp", package = "TH.data")
##D table(mammoexp$ME, predict(cforest(ME ~ ., data = mammoexp, ntree = 50),
##D                            OOB = TRUE, type = "response"))
##D 
##D ### fit forest to censored response
##D if (require("TH.data") && require("survival")) {
##D 
##D     data("GBSG2", package = "TH.data")
##D     bst <- cforest(Surv(time, cens) ~ ., data = GBSG2, ntree = 50)
##D 
##D     ### estimate conditional Kaplan-Meier curves
##D     print(predict(bst, newdata = GBSG2[1:2,], OOB = TRUE, type = "prob"))
##D 
##D     print(gettree(bst))
##D }
## End(Not run)



