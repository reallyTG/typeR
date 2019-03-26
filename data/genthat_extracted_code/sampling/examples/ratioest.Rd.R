library(sampling)


### Name: ratioest
### Title: The ratio estimator
### Aliases: ratioest
### Keywords: survey

### ** Examples

data(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[MU284$RMT85<=3000,]
attach(MU281)
# computes the inclusion probabilities using the variable P85; sample size 120
pik=inclusionprobabilities(P85,120)
# defines the variable of interest
y=RMT85
# defines the auxiliary information
x=CS82
# draws a systematic sample of size 120
s=UPsystematic(pik)
# computes the ratio estimator
ratioest(y[s==1],x[s==1],sum(x),pik[s==1])



