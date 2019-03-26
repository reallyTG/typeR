library(apex)


### Name: concatenate
### Title: Concatenate genes into a single matrix
### Aliases: concatenate concatenate,multidna-method
###   concatenate,multiphyDat-method

### ** Examples


## simple conversion with nicely ordered output
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x
plot(x)

image(concatenate(x))



