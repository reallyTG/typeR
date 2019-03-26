library(MAMS)


### Name: new.bounds
### Title: Function to update boundaries based on observed sample sizes
### Aliases: new.bounds
### Keywords: design

### ** Examples
## No test: 
# Note that some of these examples may take a few minutes to run

# 2-stage design with O'Brien & Fleming efficacy and zero futility boundary with 
# equal sample size per arm and stage. Results are equivalent to using 
# mams(K=4, J=2, alpha=0.05, power=0.9, r=1:2, r0=1:2, ushape="obf", lshape="fixed", 
#      lfix=0, sample.size=FALSE)

new.bounds(K=4, J=2, alpha=0.05, nMat=matrix(c(10, 20), nrow=2, ncol=5), u=NULL, l=NULL, 
           ushape="obf", lshape="fixed", lfix=0)

# A 2-stage design that was designed to use an O'Brien & Fleming efficacy and 
# zero futility boundary with equal sample size per arm and stage (n=14).
# The observed sample size after stage one are 10, 10, 18, 10, 13 for each arm 
# while the original upper bounds used are (3.068, 2.169) for stage 1. 
# The updated bounds are (3.068, 2.167).

new.bounds(K=4, J=2, alpha=0.05, 
           nMat=matrix(c(10, 28, 10, 28, 18, 28, 10, 28, 13, 28), nrow=2, ncol=5), 
           u=3.068, l=0, ushape="obf", lshape="fixed", lfix=0)
## End(No test)


