library(tricolore)


### Name: ColorMapSextant
### Title: Sextant Encoding of Ternary Composition
### Aliases: ColorMapSextant
### Keywords: internal

### ** Examples

P <- prop.table(matrix(runif(9), ncol = 3), 1)
tricolore:::ColorMapSextant(P, c(1/3, 1/3, 1/3),
                            c('#01A0C6', '#B8B3D8', '#F11D8C', '#FFB3B3',
                              '#FFFF00', '#B3DCC3'))



