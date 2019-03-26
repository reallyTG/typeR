library(rvgtest)


### Name: plot.rvgt.htest
### Title: Plot p-Values against Sample Size
### Aliases: plot.rvgt.htest
### Keywords: distribution hplot htest

### ** Examples

## Create a frequency table for normal distribution and show histogram.
## Use a sample of size of 5 times 10^5 random variates.
table <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, mean=1,sd=2)

## Perform a chi-square goodness-of-fit test and plot result
r1 <- rvgt.chisq(table)
plot(r1)

## Perform M-test
r2 <- rvgt.Mtest(table)
plot(r2)

## Create a plot that contains the results of both tests
plot.rvgt.htest(list(r1,r2))



