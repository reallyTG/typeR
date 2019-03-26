library(BayesLCA)


### Name: blca.em.sd
### Title: Posterior Standard Deviation Estimates for Bayesian Latent Class
###   Analysis via an EM Algorithm
### Aliases: blca.em.sd blca.em.se
### Keywords: posterior standard deviation blca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))
dat<- data.blca(x)

set.seed(1)
fit1 <- blca.em(dat, 2, se=TRUE)
fit1$itemprob.sd
fit1$classprob.sd

set.seed(1)
fit2<- blca.em(dat, 2, se=FALSE)
fit2.sd<- blca.em.sd(fit2, dat)
fit2.sd$itemprob
fit2.sd$classprob



