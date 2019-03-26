library(mombf)


### Name: mombf
### Title: Moment and inverse moment Bayes factors for linear models.
### Aliases: mombf mombf.lm imombf imombf.lm zellnerbf zellnerbf.lm
### Keywords: models htest

### ** Examples

##compute Bayes factor for Hald's data
data(hald)
lm1 <- lm(hald[,1] ~ hald[,2] + hald[,3] + hald[,4] + hald[,5])

# Set g so that prior mode for standardized effect size is at 0.2
prior.mode <- .2^2
V <- summary(lm1)$cov.unscaled
gmom <- mode2g(prior.mode,prior='normalMom')
gimom <- mode2g(prior.mode,prior='iMom')

# Set g so that interval (-0.2,0.2) has 5% prior probability
# (in standardized effect size scale)
priorp <- .05; q <- .2
gmom <- c(gmom,priorp2g(priorp=priorp,q=q,prior='normalMom'))
gimom <- c(gmom,priorp2g(priorp=priorp,q=q,prior='iMom'))

mombf(lm1,coef=2,g=gmom) #moment BF
imombf(lm1,coef=2,g=gimom,B=10^5) #inverse moment BF
zellnerbf(lm1,coef=2,g=1) #BF based on Zellner's g-prior




