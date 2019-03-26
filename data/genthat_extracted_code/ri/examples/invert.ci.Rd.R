library(ri)


### Name: invert.ci
### Title: Confidence intervals through test inversion
### Aliases: invert.ci
### Keywords: inverted test testing

### ** Examples

y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0)

perms <- genperms(Z) ## all possible permutations of assignment to treatment
probs <- genprobexact(Z) ## assuming complete randomization

c(invert.ci(y,Z,probs,perms,0.025),invert.ci(y,Z,probs,perms,0.975)) ## 95% CI



