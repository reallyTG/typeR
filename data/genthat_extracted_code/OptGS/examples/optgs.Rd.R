library(OptGS)


### Name: optgs
### Title: Finding optimal and balanced group-sequential designs
### Aliases: optgs

### ** Examples
##Find a three-stage design that minimises the maximum expected sample size.
threestagedeltaminimax=optgs(J=3,weights=c(0,0,1,0)) 
plot(threestagedeltaminimax)



