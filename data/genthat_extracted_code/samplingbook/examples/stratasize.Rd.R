library(samplingbook)


### Name: stratasize
### Title: Sample Size Determination for Stratified Sampling
### Aliases: stratasize

### ** Examples

#random proportional stratified sample
stratasize(e=0.1, Nh=c(100000,300000,600000), Sh=c(1,2,3))

#random optimal stratified sample
stratasize(e=0.1, Nh=c(100000,300000,600000), Sh=c(1,2,3), type="opt")



