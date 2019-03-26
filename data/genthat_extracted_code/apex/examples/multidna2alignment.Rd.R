library(apex)


### Name: multidna2alignment
### Title: Convert from multidna into alignment (seqinr)
### Aliases: multidna2alignment multiphyDat2alignment

### ** Examples

## Not run: 
##D ## simple conversion with nicely ordered output
##D data(woodmouse)
##D genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
##D x <- new("multidna", genes)
##D x
##D y <- multidna2alignment(x)
##D y
##D x2 <- multidna2multiphyDat(x)
##D z <- multiphyDat2alignment(x2)
## End(Not run)



