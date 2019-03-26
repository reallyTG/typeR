library(smfsb)


### Name: metrop
### Title: Run a simple Metropolis sampler with standard normal target and
###   uniform innovations
### Aliases: metrop
### Keywords: smfsb

### ** Examples

normvec=metrop(1000,1)
op=par(mfrow=c(2,1))
plot(ts(normvec))
hist(normvec,20)
par(op)



