library(rvgtest)


### Name: rvgt.chisq
### Title: Perform Chi-Square goodness-of-fit Test on RVG Frequency Table
### Aliases: rvgt.chisq
### Keywords: distribution htest

### ** Examples

## Create a frequency table for normal distribution and
## conduct a chi-square goodness-of-fit test on this data.
## Use a sample of size of 5 times 10^5 random variates.
table <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, mean=1,sd=2)

## Perform test
result <- rvgt.chisq(table)

## Plot result
plot(result)



