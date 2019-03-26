library(RcppTN)


### Name: etn
### Title: Truncated Normal Distribution Expectation
### Aliases: etn

### ** Examples

etn() ## 0
etn(0, 1, -Inf, Inf) ## 0
etn(0, 1, -9999, 9999) ## 0

etn(0, 1, 0, Inf) ## 0.798

etn(0, 1, Inf, -Inf) ## NA with warning

etn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) ## multiple expectations





