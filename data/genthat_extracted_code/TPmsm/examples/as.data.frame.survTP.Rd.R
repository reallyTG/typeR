library(TPmsm)


### Name: as.data.frame.survTP
### Title: as.data.frame method for a survTP object
### Aliases: as.data.frame.survTP
### Keywords: manip methods survival

### ** Examples

# Example for the "TPmsm" format
weiTP <- dgpTP(n=100, corr=1, dist="weibull", dist.par=c(2, 7, 2, 7),
model.cens="exponential", cens.par = 6, state2.prob=0.6)
weidata <- as.data.frame(weiTP)
head(weidata)

# Example for the "etm" format
expTP <- dgpTP(n=100, corr=1, dist="exponential", dist.par=c(1, 1),
model.cens="uniform", cens.par=3, state2.prob=0.5)
expdata <- as.data.frame(expTP, package="etm")
head(expdata)



