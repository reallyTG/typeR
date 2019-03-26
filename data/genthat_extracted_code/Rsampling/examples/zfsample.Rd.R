library(Rsampling)


### Name: zfsample
### Title: Zero-fixed (re)sampling
### Aliases: zfsample

### ** Examples

# Sampling without replacement
zfsample(c(0,1,2,0,3,4,0))
# Sampling with replacement
zfsample(c(0,1,2,0,3,4,0), replace=TRUE)
# With no zeroes, zfsample just calls sample
set.seed(42); s1<-sample(c(1,2,3,4,5,6))
set.seed(42); s2<-zfsample(c(1,2,3,4,5,6))
all.equal(s1, s2)



