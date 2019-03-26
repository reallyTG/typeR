library(TreeBUGS)


### Name: genMPT
### Title: Generate MPT Frequencies
### Aliases: genMPT

### ** Examples

# Example: Standard Two-High-Threshold Model (2HTM)
EQNfile <- system.file("MPTmodels/2htm.eqn", package="TreeBUGS")
theta <- matrix(c(.8,.4,.5,
                  .6,.3,.4), nrow=2, byrow=TRUE,
                dimnames=list(NULL, c("Do","Dn","g")))
genDat <- genMPT(theta, c(Target=250, Lure=250),
                EQNfile)
genDat



