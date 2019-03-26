library(fDMA)


### Name: archtest
### Title: Computes Engle's ARCH Test.
### Aliases: archtest

### ** Examples

wti <- crudeoil[-1,1]
ld.wti <- (diff(log(wti)))[-1,]
arch <- archtest(ts=as.vector(ld.wti),lag=10)



