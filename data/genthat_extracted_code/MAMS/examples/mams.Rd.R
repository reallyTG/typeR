library(MAMS)


### Name: mams
### Title: Function to design multi-arm multi-stage studies with normal
###   endpoints
### Aliases: mams
### Keywords: design

### ** Examples
## No test: 
## A fixed sample (single stage) design specified on the p scale
mams(K=4, J=1, alpha=0.05, power=0.9, r=1, r0=1, p=0.65, p0=0.55)

## The same design specified on the delta scale
mams(K=4, J=1, alpha=0.05, power=0.9, r=1, r0=1, p=NULL, p0=NULL,
     delta=0.545, delta0=0.178, sd=1)

## An example in Table 1 of Magirr et al (2012)
# 2-stage design with O'Brien & Fleming efficacy and zero futility boundary
mams(K=4, J=2, alpha=0.05, power=0.9, r=1:2, r0=1:2, p=0.65, p0=0.55, 
     ushape="obf", lshape="fixed", lfix=0, nstart=40)

# Note that these examples may take a few minutes to run

## 3-stage design with Triangular efficacy and futility boundary
mams(K=4, J=3, alpha=0.05, power=0.9, r=1:3, r0=1:3, p=0.65, p0=0.55, 
     ushape="triangular", lshape="triangular", nstart=30)

## Example of a custom boundary function without sample size evaluation
mams(K=6, J=3, alpha=0.05, power=0.9, r=1:3, r0=1:3, p=0.7, p0=0.5, 
     ushape=function(x)return(x:1), lshape="fixed", lfix=0, 
     sample.size=FALSE)

## Different allocation ratios between control and experimental treatments. 
## Twice as many patients are randomized to control at each stage.
mams(K=4, J=2, alpha=0.05, power=0.9, r=1:2, r0=c(2, 4), p=0.65, p0=0.55, 
     ushape="obf", lshape="fixed", lfix=0, nstart=30)
## End(No test)


