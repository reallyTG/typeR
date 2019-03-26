library(MXM)


### Name: Incremental BIC values and final regression model of the FBED algorithm
### Title: Incremental BIC values and final regression model of the FBED
###   algorithm
### Aliases: fbedreg.bic

### ** Examples

dataset <- matrix( runif(100 * 100, 1, 100), ncol = 100 )
#define a simulated class variable 
target <- rt(100, 10)
a <- fbed.reg(target, dataset, K = 10, test = "testIndFisher", method = "eBIC") 
fbedreg.bic(target, dataset, fbedreg.object = a, test = "testIndFisher")



