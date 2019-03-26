library(DoE.base)


### Name: getblock
### Title: Functions to extract a block factor from a class design object
###   or to rerandomize a class design object
### Aliases: getblock rerandomize.design
### Keywords: array design

### ** Examples

   ## a blocked full factorial design
   ff <- fac.design(nlevels=c(2,2,2,3,3,3), blocks=6, bbrep=2, wbrep=2, repeat.only=FALSE)
   getblock(ff)
   getblock(ff, combine=TRUE)
   rerandomize.design(ff)
   ff <- fac.design(nlevels=c(2,2,2,3,3,3), replications=2, repeat.only=FALSE)
   getblock(ff)  
   ff <- fac.design(nlevels=c(2,2,2,3,3,3), replications=2, repeat.only=FALSE)
   try(getblock(ff))
   ## a design created with oa.design
   small <- oa.design(nlevels=c(2,2,2,2,2,2,2,2,8))
   rerandomize.design(small, block="J")



