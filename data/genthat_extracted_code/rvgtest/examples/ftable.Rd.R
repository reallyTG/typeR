library(rvgtest)


### Name: rvgt.ftable
### Title: Create RVG Frequency Table for Random Variate Generator
### Aliases: rvgt.ftable rvgt.ftable.default
### Keywords: distribution datagen

### ** Examples

## Create a frequency table for normal distribution with mean 1 and
## standard deviation 2. Number of bins should be 50.
## Use a sample of size of 5 times 10^5 random variates.
ft <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, breaks=51, mean=1,sd=2)

## Show histogram
plot(ft)

## Run a chi-square test
rvgt.chisq(ft)

## The following allows to plot a histgram in a single call.
rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, plot=TRUE)

## Use the cumulative distribution function when the quantile function
## is not available or if its round-off errors have serious impact.
ft <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,pdist=pnorm )
plot(ft)

## Create a frequency table for the normal distribution with
## non-equidistributed break points
ft <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, breaks=1/(1:100))
plot(ft)

## A (naive) generator for a truncated normal distribution
rdist <- function(n) {
  x <- numeric(n)
  for (i in 1:n){ while(TRUE){ x[i] <- rnorm(1); if (x[i]>1) break} }
  return(x)
}
ft <- rvgt.ftable(n=1e3,rep=5, rdist=rdist,
                  pdist=pnorm, qdist=qnorm, trunc=c(1,Inf))
plot(ft)

## An example for a discrete distribution
ft <- rvgt.ftable(n=1e5,rep=1, rdist=rgeom,pdist=pgeom, prob=0.123)
plot(ft)




