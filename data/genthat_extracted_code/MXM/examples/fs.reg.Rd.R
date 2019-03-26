library(MXM)


### Name: Forward selection regression
### Title: Variable selection in regression models with forward selection
### Aliases: fs.reg
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix( runif(1000 * 20, 1, 100), ncol = 20 )

#define a simulated class variable 
target <- rt(1000, 10)

a0 <- fs.reg(target, dataset, threshold = 0.05, stopping = "BIC", tol = 2) 

a1 <- fs.reg(target, dataset, threshold = 0.05, test = "testIndRQ", stopping = "BIC", 
tol = 2) 

y <- survival::Surv(rexp(1000), rep(1,1000) )
a2 <- fs.reg(y, dataset, threshold = 0.05, test = "censIndWR", stopping = "BIC", tol = 2) 
a3 <- MMPC(target, dataset)

target <- factor( rbinom(1000, 1, 0.6) )
b2 <- fs.reg(target, dataset, threshold = 0.05, test = NULL, stopping = "BIC", tol = 2) 



