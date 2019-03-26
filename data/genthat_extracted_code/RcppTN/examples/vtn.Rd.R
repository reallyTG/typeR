library(RcppTN)


### Name: vtn
### Title: Truncated Normal Distribution Variance
### Aliases: vtn

### ** Examples

vtn() ## 1
vtn(0, 1, -Inf, Inf) ## 1
vtn(0, 1, -9999, 9999) ## 1

vtn(0, 1, 0, Inf) ## 0.36338

vtn(0, 1, Inf, -Inf) ## NA with warning

vtn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) ## multiple variances



