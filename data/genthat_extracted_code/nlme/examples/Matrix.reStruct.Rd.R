library(nlme)


### Name: Matrix.reStruct
### Title: Assign reStruct Matrices
### Aliases: matrix<-.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(Dog = ~day, Side = ~1), data = Pixel)
matrix(rs1) <- list(diag(2), 3)



