library(PDQutils)


### Name: qapx_cf
### Title: Approximate quantile via Cornish-Fisher expansion.
### Aliases: qapx_cf
### Keywords: distribution

### ** Examples

# normal distribution:
pvals <- seq(0.001,0.999,length.out=501)
q1 <- qapx_cf(pvals, c(0,1,0,0,0,0,0))
q2 <- qnorm(pvals)
q1 - q2



