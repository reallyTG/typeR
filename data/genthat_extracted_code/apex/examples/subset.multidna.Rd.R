library(apex)


### Name: [,multidna,ANY,ANY,ANY-method
### Title: Subset multidna objects
### Aliases: [,multidna,ANY,ANY,ANY-method [,multidna-method
###   [,multiphyDat,ANY,ANY,ANY-method

### ** Examples


data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x
plot(x)

## keep only the first 5 individuals
x[1:5,]
plot(x[1:5,])

## keep individuals 2,4,6 and the second gene
x[c(2,4,6),2]
plot(x[c(2,4,6),2])




