library(evolqg)


### Name: BootstrapRep
### Title: Bootstrap analysis via resampling
### Aliases: BootstrapRep
### Keywords: bootstrap repetabilities

### ** Examples

BootstrapRep(iris[,1:4], MantelCor, iterations = 5, correlation = TRUE)
             
BootstrapRep(iris[,1:4], RandomSkewers, iterations = 50)

BootstrapRep(iris[,1:4], KrzCor, iterations = 50, correlation = TRUE)

BootstrapRep(iris[,1:4], PCAsimilarity, iterations = 50)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#BootstrapRep(iris[,1:4], PCAsimilarity,
#             iterations = 5,
#             parallel = TRUE)



