library(adamethods)


### Name: stepArchetypesRawData_norm_frob
### Title: Archetype algorithm to raw data with the Frobenius norm
### Aliases: stepArchetypesRawData_norm_frob

### ** Examples

data(mtcars)
data <- as.matrix(mtcars)

numArch <- 5 
numRep <- 2

lass <- stepArchetypesRawData_norm_frob(data = data, numArch = 1:numArch, 
                                        numRep = numRep, verbose = FALSE)
                                        
str(lass)   
length(lass[[1]])
class(lass[[1]])  
                                                   



