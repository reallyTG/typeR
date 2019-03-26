library(PBSmodelling)


### Name: calcGM
### Title: Calculate the Geometric Mean, Allowing for Zeroes
### Aliases: calcGM
### Keywords: arith

### ** Examples

local(envir=.PBSmodEnv,expr={
  calcGM(c(0,1,100))
  calcGM(c(0,1,100),offset=0.01,exzero=FALSE)
})



