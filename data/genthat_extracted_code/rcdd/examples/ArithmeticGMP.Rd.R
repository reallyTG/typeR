library(rcdd)


### Name: ArithmeticGMP
### Title: GMP Rational Arithmetic
### Aliases: ArithmeticGMP qpq qmq qxq qdq qneg qabs qinv qsum qprod qmax
###   qmin qsign qmatmult
### Keywords: misc

### ** Examples

qmq("1/3", "1/2")
# note inexactness of floating point representations
qmq("1/5", 1/5)
qdq("1/5", 1/5)
qsum(c("1", "1/2", "1/4", "1/8"))
qprod(c("1", "1/2", "1/4", "1/8"))
qmax(c("-1", "1/2", "1/-4", "1/8"))
qmin(c("-1", "1/2", "1/-4", "1/8"))
qsign(c("-1", "1/2", "1/-4", "1/8"))
qmatmult(matrix(c("1", "2", "3", "4"), 2, 2),
    matrix(c("1/1", "1/2", "1/3", "1/4"), 2, 2))
qneg(seq(-3, 3))



