library(MXM)


### Name: Forward Backward Early Dropping selection regression for big data
### Title: Forward Backward Early Dropping selection regression for big
###   data
### Aliases: big.fbed.reg

### ** Examples

## Not run: 
##D #simulate a dataset with continuous data
##D x <- matrix( runif(10^6 * 50, 1, 100), ncol = 50 )
##D require(bigmemory)
##D dataset <- bigmemory::as.big.matrix(x)
##D #define a simulated class variable 
##D target <- rt(100, 10)
##D a1 <- big.fbed.reg(target, dataset, test = "testIndFisher") 
##D y <- rpois(100, 10)
##D a2 <- big.fbed.reg(y, dataset, test = "testIndPois") 
## End(Not run)



