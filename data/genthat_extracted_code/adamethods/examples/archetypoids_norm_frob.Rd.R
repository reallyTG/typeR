library(adamethods)


### Name: archetypoids_norm_frob
### Title: Archetypoid algorithm with the Frobenius norm
### Aliases: archetypoids_norm_frob

### ** Examples

data(mtcars)
data <- mtcars

k <- 3
numRep <- 2
huge <- 200

lass <- stepArchetypesRawData_norm_frob(data = data, numArch = k, 
                                        numRep = numRep, verbose = FALSE)

res <- archetypoids_norm_frob(k, data, huge, ArchObj = lass)
str(res)  
res$cases
res$rss                                                           




