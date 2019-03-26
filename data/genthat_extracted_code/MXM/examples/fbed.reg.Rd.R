library(MXM)


### Name: Forward Backward Early Dropping selection regression
### Title: Forward Backward Early Dropping selection regression
### Aliases: fbed.reg

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix( runif(100 * 50, 1, 100), ncol = 50 )
#define a simulated class variable 
target <- rt(100, 10)

a1 <- fbed.reg(target, dataset, test = "testIndReg") 
a2 <- fbed.reg(target, dataset, test = "testIndFisher") 
y <- rpois(100, 10)
a2 <- fbed.reg(y, dataset, test = "testIndPois") 
a3 <- MMPC(y, dataset)



