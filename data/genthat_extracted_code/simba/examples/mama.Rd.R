library(simba)


### Name: mama
### Title: A (convenience) wrapper function to make matrix from a
###   data.frame
### Aliases: mama
### Keywords: manip

### ** Examples

    
data(abis)
abis.spcls <- liste(abis.spec, splist=TRUE)
## see the list, it like what you get from a database
## and return to matrix-format:
abis.test <- mama(abis.spcls)




