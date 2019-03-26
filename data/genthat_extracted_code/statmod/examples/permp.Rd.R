library(statmod)


### Name: permp
### Title: Exact permutation p-values
### Aliases: permp
### Keywords: htest

### ** Examples

x <- 0:5
# Both calls give same results
permp(x=x, nperm=99, n1=6, n2=6)
permp(x=x, nperm=99, total.nperm=462)



