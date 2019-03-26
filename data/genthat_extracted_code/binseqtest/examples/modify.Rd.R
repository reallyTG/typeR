library(binseqtest)


### Name: modify
### Title: Modify binary sequential boundary
### Aliases: modify
### Keywords: htest

### ** Examples

b<-designOBF(50)
bmod<-modify(b,missN=30:36)
par(mfrow=c(2,1))
plot(b)
plot(bmod)



