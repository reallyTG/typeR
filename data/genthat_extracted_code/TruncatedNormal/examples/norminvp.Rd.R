library(TruncatedNormal)


### Name: norminvp
### Title: normal quantile function with precision
### Aliases: norminvp
### Keywords: truncated normal gaussian quantile

### ** Examples

d=150;l=1:d;u=l+Inf;
x=norminvp(runif(d),l,u) # simulate via inverse transform method



