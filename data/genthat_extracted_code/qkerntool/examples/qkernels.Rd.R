library(qkerntool)


### Name: bases
### Title: qKernel Functions
### Aliases: bases rbfbase nonlbase laplbase ratibase multbase invbase
###   wavbase powbase logbase caubase chibase studbase
### Keywords: symbolmath

### ** Examples

qkfunc <- rbfbase(sigma=1,q=0.8)
qkfunc

qpar(qkfunc)

## create two vectors
x <- rnorm(10)
y <- rnorm(10)

## calculate dot product
qkfunc(x,y)




