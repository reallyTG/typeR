library(copula)


### Name: indepTest
### Title: Test Independence of Continuous Random Variables via Empirical
###   Copula
### Aliases: indepTest indepTestSim dependogram
### Keywords: htest

### ** Examples

## Consider the following example taken from
## Genest and Remillard (2004), p 352:

set.seed(2004)
x <- matrix(rnorm(500),100,5)
x[,1] <- abs(x[,1]) * sign(x[,2] * x[,3])
x[,5] <- x[,4]/2 + sqrt(3) * x[,5]/2

## In order to test for independence "within" x, the first step consists
## in simulating the distribution of the test statistics under
## independence for the same sample size and dimension,
## i.e. n=100 and p=5. As we are going to consider all the subsets of
## {1,...,5} whose cardinality is between 2 and 5, we set p=m=5.

## For a realistic N = 1000 (default), this takes a few seconds:
N. <- if(copula:::doExtras()) 1000 else 120
N.
system.time(d <- indepTestSim(100, 5, N = N.))
## For N=1000,  2 seconds (lynne 2015)
## You could save 'd' for future use, via  saveRDS()

## The next step consists of performing the test itself (and print its results):
(iTst <- indepTest(x,d))

## Display the dependogram with the details:
dependogram(iTst, print=TRUE)

## We could have tested for a weaker form of independence, for instance,
## by only computing statistics for subsets whose cardinality is between 2
## and 3. Consider for instance the following data:
y <- matrix(runif(500),100,5)
## and perform the test:
system.time( d <- indepTestSim(100,5,3, N=N.) )
iTy <- indepTest(y,d)
iTy
dependogram(iTy, print=TRUE)

## Don't show: 
try( indepTestSim(2e9, 5) )#-> error ".. n ... too large" % segfault previously
## End(Don't show)



