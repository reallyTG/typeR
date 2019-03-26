library(bpcp)


### Name: bpcp2samp
### Title: Melded BPCP test
### Aliases: bpcp2samp
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(leuk2)
bpcp2samp(leuk2$time,leuk2$status,leuk2$treatment,35,parmtype="ratio")

bpcp2samp(leuk2$time,leuk2$status,leuk2$treatment,35,parmtype="difference")




