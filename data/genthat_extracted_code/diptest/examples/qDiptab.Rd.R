library(diptest)


### Name: qDiptab
### Title: Table of Quantiles from a Large Simulation for Hartigan's Dip
###   Test
### Aliases: qDiptab
### Keywords: datasets

### ** Examples

data(qDiptab)
str(qDiptab)
## the sample sizes `n' :
dnqd <- dimnames(qDiptab)
(nn <- as.integer(dnqd $n))
## the probabilities:
P.p <- as.numeric(print(dnqd $ Pr))

## This is as "Table 1" in Hartigan & Hartigan (1985) -- but more accurate
ps <- c(1,5,10,50,90,95,99, 99.5, 99.9)/100
tab1 <- qDiptab[nn <= 200,  as.character(ps)]
round(tab1, 4)



