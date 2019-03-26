library(otrimle)


### Name: otrimle
### Title: Optimally Tuned Robust Improper Maximum Likelihood Clustering
### Aliases: otrimle print.otrimle

### ** Examples

## Load  Swiss banknotes data
data(banknote)
x <- banknote[,-1]

## Perform otrimle clustering with default arguments
set.seed(1)
a <- otrimle(data=x, G=2, logicd=c(-Inf, -50, -10), ncores=1)


## Plot clustering
plot(a, data=x, what="clustering")

## Plot OTRIMLE criterion profiling
plot(a, what="criterion")

## Plot Improper log-likelihood profiling
plot(a, what="iloglik")

## P-P plot of the clusterwise empirical weighted squared Mahalanobis
## distances against the target distribution pchisq(, df=ncol(data))
plot(a, what="fit")
plot(a, what="fit", cluster=1)


## Not run: 
##D ## Perform the same example using the finer default grid of logicd
##D ## values using multiple cores
##D ##
##D a <- otrimle(data = x, G = 2)
##D 
##D ## Inspect the otrimle criterion-vs-logicd
##D plot(a, what = 'criterion')
##D 
##D ## The minimum occurs at  a$logicd=-9, and exploring a$optimization it
##D ## cane be seen that the interval [-12.5, -4] brackets the optimal
##D ## solution. We search with a finer grid located around the minimum
##D ##
##D b <- otrimle(data = x, G = 2, logicd = seq(-12.5, -4, length.out = 25))
##D 
##D ## Inspect the otrimle criterion-vs-logicd
##D plot(b, what = 'criterion')
##D 
##D ## Check the difference between the two clusterings
##D table(A = a$cluster, B = b$cluster)
##D 
##D ## Check differences in estimated parameters
##D ##
##D colSums(abs(a$mean - b$mean))               ## L1 distance for mean vectors
##D apply({a$cov-b$cov}, 3, norm, type = "F")   ## Frobenius distance for covariances
##D c(Noise=abs(a$npr-b$npr), abs(a$cpr-b$cpr)) ## Absolute difference for proportions
## End(Not run)



