library(RRreg)


### Name: RRlog
### Title: Logistic randomized response regression
### Aliases: RRlog

### ** Examples

# generate data set without biases
dat <- RRgen(1000,pi=.3,"Warner",p=.9)
dat$covariate <- rnorm(1000)
dat$covariate[dat$true==1] <- rnorm(sum(dat$true==1),.4,1)
# analyse
ana <- RRlog(response~covariate,dat,"Warner", p=.9, fit.n = 1)
summary(ana)
# check with true, latent states:
glm(true~covariate, dat, family=binomial(link="logit"))



