library(adamethods)


### Name: stepArchetypesRawData_robust
### Title: Archetype algorithm to raw data with the robust Frobenius norm
### Aliases: stepArchetypesRawData_robust

### ** Examples

data(mtcars)
data <- as.matrix(mtcars)

numArch <- 5 
numRep <- 2

lass <- stepArchetypesRawData_robust(data = data, numArch = 1:numArch, 
                                     numRep = numRep, verbose = FALSE,
                                     saveHistory = FALSE, prob = 0.8)
str(lass)   
length(lass[[1]])
class(lass[[1]])                                       
                 



