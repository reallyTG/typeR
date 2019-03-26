library(tricolore)


### Name: ColorMapTricolore
### Title: CIE-Lch Mixture of Ternary Composition
### Aliases: ColorMapTricolore
### Keywords: internal

### ** Examples

P <- prop.table(matrix(runif(9), ncol = 3), 1)
tricolore:::ColorMapTricolore(P, center = rep(1/3, 3), breaks = 4,
                              h_ = 80, c_ = 140, l_ = 80,
                              contrast = 0.4, spread = 1)




