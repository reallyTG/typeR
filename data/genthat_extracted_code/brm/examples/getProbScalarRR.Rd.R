library(brm)


### Name: getProbScalarRR
### Title: Calculate risks from log RR and log OP
### Aliases: getProbScalarRR

### ** Examples

getProbScalarRR(0,0)

set.seed(0)
logrr = rnorm(10,0,1)
logop = rnorm(10,0,1)
probs = mapply(getProbScalarRR, logrr, logop)
rownames(probs) = c("P(y=1|x=0)","P(y=1|x=1)")
probs




