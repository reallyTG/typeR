library(ri)


### Name: omni.ate
### Title: Omnibus function for estimation and testing
### Aliases: omni.ate
### Keywords: randomization estimation testing

### ** Examples

y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1)

perms <- genperms(Z) # all possible permutations of assignment

omni.ate(y,Z,perms,FALSE)
# omni.ate(y,Z,perms,TRUE) # may take some time to run



