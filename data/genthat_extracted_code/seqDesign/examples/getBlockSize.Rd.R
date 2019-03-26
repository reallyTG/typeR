library(seqDesign)


### Name: getBlockSize
### Title: Determine block size for use in blocked randomization
### Aliases: getBlockSize

### ** Examples


getBlockSize(nvec = c(375, 375) ) 
## specify a minimum block size of 10 (no maximum)
getBlockSize(nvec = c(375, 375), range = c(10, Inf) ) 

getBlockSize( nvec = c(30, 510, 390) )
## require a minimum block size of 10 and maximum of 30 
## (not possible with this nvec, so function returns NA)
getBlockSize( nvec = c(30, 510, 390), range = c(10, 30) )



