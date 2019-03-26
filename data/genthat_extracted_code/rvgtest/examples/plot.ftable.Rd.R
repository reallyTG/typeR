library(rvgtest)


### Name: plot.rvgt.ftable
### Title: Plot RVG Frequency Table
### Aliases: plot.rvgt.ftable
### Keywords: distribution hplot

### ** Examples

## Create a frequency table for normal distribution and show histogram.
## Use a sample of size of 5 times 10^5 random variates.
ft <- rvgt.ftable(n=1e5,rep=5, rdist=rnorm,qdist=qnorm, mean=1,sd=2)

## Plot histogram
plot(ft)

## Plot histogram for row 1 only
plot(ft,rows=1)

## Plot histogram for rows 2 and 4 only
plot(ft,rows=c(2,4))

## Same with the buggy random variate generator
## (try to increase sample size 'n' or 'rep')
RNGkind(normal.kind="Buggy Kinderman-Ramage")
ft <- rvgt.ftable(n=1e5,rep=1, rdist=rnorm,qdist=qnorm)
plot(ft)




