library(Davies)


### Name: plotcf
### Title: p-value investigation
### Aliases: plotcf
### Keywords: distribution

### ** Examples

f.H0.T <- function(n,free=5){t.test(rt(n,df=free))$p.value}
f.H0.F <- function(n,free=5){t.test(rf(n,df1=free,df2=free))$p.value}

plotcf(sapply(rep(10,100),f.H0.T))  # should reject about 5: thus
                                     # probability of a type I error is
                                     # about 0.05 (as it should be; this
                                     # is an exact test)
plotcf(sapply(rep(10,100),f.H0.F))  # should reject about 80: thus
                                     # probability of a type II error is
                                     # about 0.2 for this H_A.





