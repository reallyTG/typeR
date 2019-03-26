library(arulesSequences)


### Name: similarity-methods
### Title: Compute Similarities
### Aliases: similarity similarity,sequences-method is.subset
###   is.subset,sequences-method is.superset is.superset,sequences-method
###   coerce,dsCMatrix,dist-method
### Keywords: manip

### ** Examples

## use example data
data(zaki)
z <- as(zaki, "timedsequences")
similarity(z)

# require equality
similarity(z, strict = TRUE)

## emphasize common
similarity(z, method = "dice")

## 
is.subset(z)
is.subset(z, proper = TRUE)



