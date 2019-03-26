library(apex)


### Name: multidna2multiphyDat
### Title: Conversions between multidna and multiphyDat
### Aliases: multidna2multiphyDat multiphyDat2multidna

### ** Examples


## simple conversion with nicely ordered output
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x

## conversion multidna -> multiphyDat
y <- multidna2multiphyDat(x)
y

## check round trip
identical(x, multiphyDat2multidna(y))




