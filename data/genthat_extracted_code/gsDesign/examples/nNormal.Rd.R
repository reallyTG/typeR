library(gsDesign)


### Name: nNormal
### Title: Normal distribution sample size (2-sample)
### Aliases: nNormal
### Keywords: design

### ** Examples

# EXAMPLES
# equal variances
nNormal(delta1=.5,sd=1.1,alpha=.025,beta=.2)
# unequal variances
nNormal(delta1=.5,sd=1.1,sd2=2,alpha=.025,beta=.2)
# unequal sample sizes
nNormal(delta1=.5,sd=1.1,alpha=.025,beta=.2, ratio=2)
# non-inferiority assuming a better effect than null
nNormal(delta1=.5,delta0=-.1,sd=1.2)



