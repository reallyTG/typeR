library(spc)


### Name: xcusum.sf
### Title: Compute the survival function of CUSUM run length
### Aliases: xcusum.sf
### Keywords: ts

### ** Examples

## Waldmann (1986), one-sided CUSUM, Table 2

k <- .5
h <- 3
mu <- 0 # corresponds to Waldmann's -0.5
SF <- xcusum.sf(k, h, 0, 1000)
plot(1:length(SF), SF, type="l", xlab="n", ylab="P(L>n)", ylim=c(0,1))
#



