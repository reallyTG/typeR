library(TRAMPR)


### Name: create.diffsmatrix
### Title: Calculate Matrix of Distances between Peaks
### Aliases: create.diffsmatrix
### Keywords: multivariate cluster

### ** Examples

data(demo.samples)
data(demo.knowns)

s <- length(labels(demo.samples))
k <- length(labels(demo.knowns))
n <- nrow(unique(demo.knowns$data[c("enzyme", "primer")]))

m <- create.diffsmatrix(demo.samples, demo.knowns)

dim(m)
identical(dim(m), c(s, k, n))

## Maximum error for each sample/known (i.e. across all enzyme/primer
## combinations), similar to how calculated by TRAMP
error <- apply(abs(m), 1:2, max, na.rm=TRUE)
dim(error)

## Euclidian error (see ?TRAMP)
error.euclid <- sqrt(rowSums(m^2, TRUE, 2))/rowSums(!is.na(m), dims=2)

## Euclidian and maximum error will require different values of
## accept.error in TRAMP:
plot(error, error.euclid, pch=".")



