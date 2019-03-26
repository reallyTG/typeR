library(RobAStBase)


### Name: RobAStBase-package
### Title: Robust Asymptotic Statistics
### Aliases: RobAStBase-package RobAStBase
### Keywords: package

### ** Examples

library(RobAStBase)

## some L2 differentiable parametric family from package distrMod, e.g.
B <- BinomFamily(size = 25, prob = 0.25) 

## classical optimal IC
IC0 <- optIC(model = B, risk = asCov())
plot(IC0) # plot IC
checkIC(IC0, B)



