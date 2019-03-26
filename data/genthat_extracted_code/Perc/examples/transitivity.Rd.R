library(Perc)


### Name: transitivity
### Title: calculate transitivity measurements for a matrix
### Aliases: transitivity

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# transitivity calculation
conftrans <- transitivity(confmatrix, strict = FALSE)
conftrans$transitive
conftrans$intransitive
conftrans$transitivity
conftrans$alpha



