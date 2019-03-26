library(apex)


### Name: plot,multidna,ANY-method
### Title: Display multidna objects
### Aliases: plot,multidna,ANY-method plot,multidna-method

### ** Examples

## simple conversion with nicely ordered output
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x
plot(x)




