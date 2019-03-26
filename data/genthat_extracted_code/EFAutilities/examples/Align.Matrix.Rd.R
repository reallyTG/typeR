library(EFAutilities)


### Name: Align.Matrix
### Title: Factor Alignment
### Aliases: Align.Matrix
### Keywords: exploratory factor analysis factor rotation factor loadings

### ** Examples

#Order Matrix
A <- matrix(c(0.8,0.7,0,0,0,0,0.8,0.7),nrow=4,ncol=2)

#Input.Matrix
B <-matrix(c(0,0,-0.8,-0.7,1,-0.2,0.8,0.7,0,0,-0.2,1),nrow=6,ncol=2)

Align.Matrix(Order.Matrix=A, Input.Matrix=B)




