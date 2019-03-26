library(Exact)


### Name: exact.test
### Title: Unconditional exact tests for 2x2 tables
### Aliases: exact.test binomialCode multinomialCode
### Keywords: Barnard Boschloo Unconditional Exact Tests

### ** Examples

data <- matrix(c(7, 8, 12, 3), 2, 2, byrow=TRUE)
exact.test(data, alternative="less",to.plot=TRUE)
exact.test(data, alternative="two.sided", interval=TRUE, beta=0.001, npNumbers=100,
           method="Z-pooled",to.plot=FALSE)
exact.test(data, alternative="two.sided", interval=TRUE, beta=0.001, npNumbers=100,
           method="Boschloo", to.plot=FALSE)

#Example from Barnard's (1947) appendix:
data <- matrix(c(4, 0, 3, 7), 2, 2,
               dimnames=list(c("Box 1","Box 2"), c("Defective","Not Defective")))
exact.test(data, method="CSM", alternative="two.sided")

data <- matrix(c(6, 8, 4, 3), 2, 2, byrow=TRUE)
exact.test(data, model="Multinomial", alternative="less", method="Z-pooled")



