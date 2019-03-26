library(hdm)


### Name: rlassologitEffects
### Title: rigorous Lasso for Logistic Models: Inference
### Aliases: rlassologitEffect rlassologitEffects
###   rlassologitEffects.default rlassologitEffects.formula

### ** Examples

## Not run: 
##D library(hdm)
##D ## DGP
##D set.seed(2)
##D n <- 250
##D p <- 100
##D px <- 10
##D X <- matrix(rnorm(n*p), ncol=p)
##D colnames(X) = paste("V", 1:p, sep="")
##D beta <- c(rep(2,px), rep(0,p-px))
##D intercept <- 1
##D P <- exp(intercept + X %*% beta)/(1+exp(intercept + X %*% beta))
##D y <- rbinom(length(y), size=1, prob=P)
##D xd <- X[,2:50]
##D d <- X[,1]
##D logit.effect <- rlassologitEffect(x=xd, d=d, y=y)
##D logit.effects <- rlassologitEffects(X,y, index=c(1,2,40))
##D logit.effects.f <- rlassologitEffects(y ~ X, I = ~ V1 + V2)
## End(Not run)



