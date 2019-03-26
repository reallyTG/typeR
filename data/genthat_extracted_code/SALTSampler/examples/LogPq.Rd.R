library(SALTSampler)


### Name: LogPq
### Title: Computes log(p) and log(1-p)
### Aliases: LogPq

### ** Examples

#Find log(p) and log(q) for x = logit(0.2)
a <- log(0.2/(1 - 0.2))
LogPq(x = a)

#Find log(p) and log(q) for x = logit(1e-4)
b <- log(1e-4/(1 - 1e-4))
LogPq(x = b)



