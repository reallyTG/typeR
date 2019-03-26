library(otrimle)


### Name: rimle
### Title: Robust Improper Maximum Likelihood Clustering
### Aliases: rimle print.rimle

### ** Examples

## Load  Swiss banknotes data
data(banknote)
x <- banknote[,-1]

## -----------------------------------------------------------------------------
## EXAMPLE 1:
## Perform RIMLE with default inputs
## -----------------------------------------------------------------------------
set.seed(1)
a <- rimle(data = x, G = 2)
print(a)

## Plot clustering
plot(a, data = x, what = "clustering")

## P-P plot of the clusterwise empirical weighted squared Mahalanobis
## distances against the target distribution pchisq(, df=ncol(data))
plot(a, what = "fit")
plot(a, what = "fit", cluster = 1)



## -----------------------------------------------------------------------------
## EXAMPLE 2:
## Compare solutions for different choices of logicd
## -----------------------------------------------------------------------------
set.seed(1)

## Case 1: noiseless solution, that is fit a pure Gaussian Mixture Model
b1 <- rimle(data = x, G = 2, logicd = -Inf)
plot(b1, data=x, what="clustering")
plot(b1, what="fit")

## Case 2: low noise level
b2 <- rimle(data = x, G = 2, logicd = -100)
plot(b2, data=x, what="clustering")
plot(b2, what="fit")

## Case 3: medium noise level
b3 <- rimle(data = x, G = 2, logicd = -10)
plot(b3, data=x, what="clustering")
plot(b3, what="fit")

## Case 3: large noise level
b3 <- rimle(data = x, G = 2, logicd = 5)
plot(b3, data=x, what="clustering")
plot(b3, what="fit")




