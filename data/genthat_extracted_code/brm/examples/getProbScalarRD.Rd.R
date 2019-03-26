library(brm)


### Name: getProbScalarRD
### Title: Calculate risks from arctanh RD and log OP
### Aliases: getProbScalarRD

### ** Examples

getProbScalarRD(0,0)

set.seed(0)
logrr = rnorm(10,0,1)
logop = rnorm(10,0,1)
probs = mapply(getProbScalarRD, logrr, logop)
rownames(probs) = c("P(y=1|x=0)","P(y=1|x=1)")
probs




