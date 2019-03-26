library(MAMS)


### Name: tite.mams
### Title: Function to design multi-arm multi-stage studies with
###   time-to-event endpoints
### Aliases: tite.mams
### Keywords: design

### ** Examples
## No test: 
## An example 2-stage design with triangular efficacy and futility boundaries
tite.mams(hr=2, hr0=1.5, K=3, J=2, alpha=0.05, power=0.9,
          r=1:2, r0=1:2, ushape="triangular", lshape="triangular")
## End(No test)


