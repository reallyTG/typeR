library(CPAT)


### Name: get_lrv_vec
### Title: Long-Run Variance Estimation With Possible Change Points
### Aliases: get_lrv_vec

### ** Examples

x <- rnorm(1000)
CPAT:::get_lrv_vec(x)
CPAT:::get_lrv_vec(x, kernel = "pa", bandwidth = "nw")



