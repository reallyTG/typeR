library(TRAMPR)


### Name: TRAMP
### Title: TRFLP Analysis and Matching Program
### Aliases: TRAMP
### Keywords: multivariate cluster

### ** Examples

data(demo.knowns)
data(demo.samples)

res <- TRAMP(demo.samples, demo.knowns)

## The resulting object can be interrogated with methods:

## The goodness of fit of the sample with sample.pk=101 (see
## ?plot.TRAMP).
plot(res, 101)

## Not run: 
##D ## To see all plots (this produces many figures), one after another.
##D op <- par(ask=TRUE)
##D plot(res)
##D par(op)
## End(Not run)

## Produce a presence/absence matrix (see ?summary.TRAMP).
m <- summary(res)
head(m)



