library(adamethods)


### Name: archetypoids_robust
### Title: Archetypoid algorithm with the robust Frobenius norm
### Aliases: archetypoids_robust

### ** Examples

data(mtcars)
data <- mtcars

k <- 3
numRep <- 2
huge <- 200

lass <- stepArchetypesRawData_robust(data = data, numArch = k, 
                                     numRep = numRep, verbose = FALSE, 
                                     saveHistory = FALSE, prob = 0.8)

res <- archetypoids_robust(k, data, huge, ArchObj = lass, 0.8)
str(res)    
res$cases
res$rss                                                           
              



