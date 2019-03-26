library(DescTools)


### Name: MosesTest
### Title: Moses Test of Extreme Reactions
### Aliases: MosesTest MosesTest.default MosesTest.formula
### Keywords: htest

### ** Examples

x <- c(0.80, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46)
y <- c(1.15, 0.88, 0.90, 0.74, 1.21)

MosesTest(x, y)


set.seed(1479)
x <- sample(1:20, 10, replace=TRUE)
y <- sample(5:25, 6, replace=TRUE)

MosesTest(x, y)



