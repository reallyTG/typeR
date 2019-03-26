library(qkerntool)


### Name: qkernel-class
### Title: Class "qkernel" "rbfqkernel" "nonlqkernel" "laplqkernel"
###   "ratiqkernel"
### Aliases: qkernel-class qpar,qkernel-method show,qkernel-method
###   rbfqkernel-class nonlqkernel-class laplqkernel-class
###   ratiqkernel-class multqkernel-class invqkernel-class wavqkernel-class
###   powqkernel-class logqkernel-class cauqkernel-class chiqkernel-class
###   studqkernel-class kfunction-class input-class
### Keywords: classes

### ** Examples

qkfunc <- rbfbase(sigma=1,q=0.8)
qkfunc

qpar(qkfunc)

## create two vectors
x <- rnorm(10)
y <- rnorm(10)

## calculate dot product
qkfunc(x,y)




