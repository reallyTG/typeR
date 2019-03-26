library(gamlss.mx)


### Name: enzyme
### Title: Data used in gamlss.mx
### Aliases: enzyme brains
### Keywords: datasets

### ** Examples

data(enzyme)
hist(enzyme$act)
data(brains)
brains$lbrain<-log(brains$brain)
brains$lbody<-log(brains$body)
with(brains, plot(lbrain~lbody))



