library(MXM)


### Name: Backward selection regression using the eBIC
### Title: Backward selection regression using the eBIC
### Aliases: ebic.bsreg

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix( runif(100 * 30, 1, 100), ncol = 30 )
#define a simulated class variable 
target <- rt(100, 10)

a1 <- ebic.bsreg(target, dataset, test = "testIndReg") 
target <- rpois(100, 10)
a2 <- ebic.bsreg(target, dataset, test = "testIndPois") 



