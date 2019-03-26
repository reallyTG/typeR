library(tensorA)


### Name: add.tensor
### Title: Element-wise arithmetic operations +,-,*,/ with tensors
### Aliases: add.tensor -.tensor +.tensor *.tensor /.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:20,c(U=2,V=2,W=5))
add.tensor(A,A)/2 -A
(A+A)/2
A/A
A * 1/A
norm.tensor(reorder.tensor(A,c(2,3,1)) - A)



