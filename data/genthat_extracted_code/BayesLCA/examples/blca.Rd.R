library(BayesLCA)


### Name: blca
### Title: Bayesian Latent Class Analysis with one of several methods
### Aliases: blca
### Keywords: blca lca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))

set.seed(1)
fit <- blca(x, 2) ## EM algorithm used, warning returned
print(fit)	  ## No posterior standard deviations returned
summary(fit)

set.seed(1)
fit2 <- blca(x, 2, method="em", sd=TRUE) ##No warning - same fit
print(fit2) 				 ##Posterior standard deviations returned

set.seed(1)
##Variational Bayes approximation, with priors specified.
fit3 <- blca(x, 2, method="vb", delta=c(5,5), alpha=2, beta=1) 
print(fit3)	##Posterior standard deviations returned also.
par(mfrow=c(3,2))			  
plot(fit3, which=3:4)
par(mfrow=c(1,1))



