library(GLMsData)


### Name: pock
### Title: Pock counts
### Aliases: pock
### Keywords: datasets

### ** Examples

data(pock)
with( pock, tapply( Count, list(Dilution), mean) )
with( pock, tapply( Count, list(Dilution), var) )



