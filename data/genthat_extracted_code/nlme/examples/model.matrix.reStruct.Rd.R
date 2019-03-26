library(nlme)


### Name: model.matrix.reStruct
### Title: reStruct Model Matrix
### Aliases: model.matrix.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(Dog = ~day, Side = ~1), data = Pixel)
model.matrix(rs1, Pixel)



