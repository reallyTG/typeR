library(MAMS)


### Name: ordinal.mams
### Title: Function to design multi-arm multi-stage studies with ordinal or
###   binary endpoints
### Aliases: ordinal.mams
### Keywords: design

### ** Examples
## No test: 
## An example based on the example in Whitehead & Jaki (2009)
# 2-stage design with triangular efficacy and futility boundaries
prob <- c(0.075, 0.182, 0.319, 0.243, 0.015, 0.166)
ordinal.mams(prob=prob, or=3.06, or0=1.32, K=3, J=2, alpha=0.05,
             power=0.9, r=1:2, r0=1:2, ushape="triangular",
             lshape="triangular")
## End(No test)


