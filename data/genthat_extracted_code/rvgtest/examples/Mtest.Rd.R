library(rvgtest)


### Name: rvgt.Mtest
### Title: Perform M-Test on RVG Frequency Table
### Aliases: rvgt.Mtest
### Keywords: distribution htest

### ** Examples

## Create a frequency table for normal distribution and
## conduct an M-test on this data.
## Use a sample of size of 5 times 10^5 random variates.
table <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, mean=1,sd=2)

## Perform test
result <- rvgt.Mtest(table)

## Plot result
plot(result)



