library(tricolore)


### Name: Tricolore
### Title: Ternary Balance Color Scale
### Aliases: Tricolore

### ** Examples

P <- as.data.frame(prop.table(matrix(runif(3^6), ncol = 3), 1))
Tricolore(P, 'V1', 'V2', 'V3')




