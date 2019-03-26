library(grpreg)


### Name: logLik.grpreg
### Title: logLik method for grpreg
### Aliases: logLik logLik.grpreg

### ** Examples

data(Birthwt)
X <- Birthwt$X
y <- Birthwt$bwt
group <- Birthwt$group
fit <- grpreg(X,y,group,penalty="cMCP")
logLik(fit) ## Display is glitchy for vectors
AIC(fit)
BIC(fit)



