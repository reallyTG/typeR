library(sampling)


### Name: writesample
### Title: All possible samples of fixed size
### Aliases: writesample
### Keywords: survey

### ** Examples

# all samples of size 4
# from a population of size 10.
w=writesample(4,10)
# the samples are
t(apply(w,1,function(x) (1:ncol(w))[x==1]))



