library(qkerntool)


### Name: cnds
### Title: CND Kernel Functions
### Aliases: cnds nonlcnd polycnd rbfcnd laplcnd anocnd raticnd multcnd
###   invcnd wavcnd powcnd logcnd caucnd chicnd studcnd
### Keywords: symbolmath

### ** Examples

cndkfunc <- rbfcnd(gamma = 1)
cndkfunc

qpar(cndkfunc)

## create two vectors
x <- rnorm(10)
y <- rnorm(10)

## calculate dot product
cndkfunc(x,y)




