library(klaR)


### Name: xtractvars
### Title: Variable clustering based variable selection
### Aliases: xtractvars
### Keywords: cluster multivariate classif manip attribute

### ** Examples

    data(B3)
    ccres <- corclust(B3)
    plot(ccres)
    cvtres <- cvtree(ccres, k = 3)
    newdata <- xtractvars(cvtres, B3, thres = 0.5) 



