library(rrcov3way)


### Name: do3Scale
### Title: Centering and scaling
### Aliases: do3Scale do3Scale.default do3Scale.parafac do3Scale.tucker3
### Keywords: array multivariate algebra

### ** Examples

    data(elind)
    (x1 <- do3Scale(elind, center=TRUE, scale=TRUE))
    (x2 <- do3Scale(elind, center=TRUE, scale=TRUE, center.mode="B"))
    (x3 <- do3Scale(elind, center=TRUE, scale=TRUE, center.mode="C", scale.mode="C"))



