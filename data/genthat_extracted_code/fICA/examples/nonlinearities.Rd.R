library(fICA)


### Name: nonlinearities
### Title: Set of Nonlinearities for Adaptive Deflation-based FastICA
###   Method
### Aliases: nonlinearities gf dgf Gf gnames
### Keywords: utilities

### ** Examples

# leaving out functions from the default set and adding a new function  
g <- function(x){x^2}
dg <- function(x){2*x}
G <- function(x){x^3/3}

gf_new <- c(gf[-c(6,8,10)],g)
dgf_new <- c(dgf[-c(6,8,10)],dg)
Gf_new <- c(Gf[-c(6,8,10)],G)
gnames_new <- c(gnames[-c(6,8,10)],"skew")



