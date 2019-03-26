library(fBasics)


### Name: lcg
### Title: Generator for Portable Random Innovations
### Aliases: lcg set.lcgseed get.lcgseed runif.lcg rnorm.lcg rt.lcg
### Keywords: programming

### ** Examples

## set.lcgseed -
   set.lcgseed(seed = 65890)
 
## runif.lcg - rnorm.lcg - rt.lcg -
   cbind(runif.lcg(10), rnorm.lcg(10), rt.lcg(10, df = 4))

## get.lcgseed -
   get.lcgseed()  
   
## Note, to overwrite rnorm, use
   # rnorm = rnorm.lcg
   # Going back to rnorm
   # rm(rnorm)



