library(tricolore)


### Name: TricoloreSextant
### Title: Ternary Sextant Color Scale
### Aliases: TricoloreSextant

### ** Examples

P <- as.data.frame(prop.table(matrix(runif(3^6), ncol = 3), 1))
TricoloreSextant(P, 'V1', 'V2', 'V3')




