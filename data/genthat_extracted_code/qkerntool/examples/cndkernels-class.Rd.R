library(qkerntool)


### Name: cndkernel-class
### Title: Class "cndkernel" "nonlkernel" "polykernel" "rbfkernel"
###   "laplkernel"
### Aliases: cndkernel-class qpar,cndkernel-method show,cndkernel-method
###   nonlkernel-class polykernel-class rbfkernel-class laplkernel-class
###   anokernel-class ratikernel-class multkernel-class invkernel-class
###   wavkernel-class powkernel-class logkernel-class caukernel-class
###   chikernel-class studkernel-class
### Keywords: classes

### ** Examples

cndkfunc <- rbfcnd(gamma = 1)
cndkfunc

qpar(cndkfunc)

## create two vectors
x <- rnorm(10)
y <- rnorm(10)


cndkfunc(x,y)



