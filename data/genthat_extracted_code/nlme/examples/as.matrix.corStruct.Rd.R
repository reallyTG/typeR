library(nlme)


### Name: as.matrix.corStruct
### Title: Matrix of a corStruct Object
### Aliases: as.matrix.corStruct
### Keywords: models

### ** Examples

cst1 <- corAR1(form = ~1|Subject)
cst1 <- Initialize(cst1, data = Orthodont)
as.matrix(cst1)



