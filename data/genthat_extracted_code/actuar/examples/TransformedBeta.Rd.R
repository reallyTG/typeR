library(actuar)


### Name: TransformedBeta
### Title: The Transformed Beta Distribution
### Aliases: TransformedBeta dtrbeta ptrbeta qtrbeta rtrbeta mtrbeta
###   levtrbeta Pearson6 dpearson6 ppearson6 qpearson6 rpearson6 mpearson6
###   levpearson6
### Keywords: distribution

### ** Examples

exp(dtrbeta(2, 2, 3, 4, 5, log = TRUE))
p <- (1:10)/10
ptrbeta(qtrbeta(p, 2, 3, 4, 5), 2, 3, 4, 5)
qpearson6(0.3, 2, 3, 4, 5, lower.tail = FALSE)

## variance
mtrbeta(2, 2, 3, 4, 5) - mtrbeta(1, 2, 3, 4, 5)^2

## case with shape1 - order/shape2 > 0
levtrbeta(10, 2, 3, 4, scale = 1, order = 2)

## case with shape1 - order/shape2 < 0
levtrbeta(10, 1/3, 0.75, 4, scale = 0.5, order = 2)



