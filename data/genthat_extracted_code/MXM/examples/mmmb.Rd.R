library(MXM)


### Name: The max-min Markov blanket algorithm
### Title: Max-min Markov blanket algorithm
### Aliases: mmmb
### Keywords: Markov Blanket Variable Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix( runif(1000 * 50, 1, 100), ncol = 50 )
#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 50] + 3 * dataset[, 20] + rnorm(1000, 0, 5)
aa <- mmmb(target , dataset , max_k = 3 , threshold = 0.05, test= "testIndFisher", 
ncores = 1,)
ab <- SES(target, dataset, test="testIndFisher")



