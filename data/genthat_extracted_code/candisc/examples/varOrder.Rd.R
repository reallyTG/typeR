library(candisc)


### Name: varOrder
### Title: Order variables according to canonical structure or other
###   criteria
### Aliases: varOrder varOrder.mlm varOrder.data.frame
### Keywords: manip multivariate

### ** Examples

data(Wine, package="candisc")
Wine.mod <- lm(as.matrix(Wine[, -1]) ~ Cultivar, data=Wine)
Wine.can <- candisc(Wine.mod)
plot(Wine.can, ellipse=TRUE)

# pairs.mlm HE plot, variables in given order
pairs(Wine.mod, fill=TRUE, fill.alpha=.1, var.cex=1.5)

order <- varOrder(Wine.mod)
pairs(Wine.mod, variables=order, fill=TRUE, fill.alpha=.1, var.cex=1.5)




