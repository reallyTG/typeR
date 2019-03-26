library(factorplot)


### Name: summary.factorplot
### Title: Summary method for objects of class factorplot
### Aliases: summary.factorplot

### ** Examples

x <- as.factor(round(runif(1000, .5,5.5)))
levels(x) <- paste("lab", 1:20, sep="")
X <- model.matrix(~x)
b <- rnorm(ncol(X),0,4)
Y.hat <- X %*% b 
Y <- Y.hat  + rnorm(1000)
mod <- lm(Y ~ x)
fp <- factorplot(mod, factor.variable="x", pval=0.05, order="alph")
summary(fp)



