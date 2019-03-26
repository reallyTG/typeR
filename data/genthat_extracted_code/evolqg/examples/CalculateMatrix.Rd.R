library(evolqg)


### Name: CalculateMatrix
### Title: Calculate Covariance Matrix from a linear model fitted with lm()
### Aliases: CalculateMatrix
### Keywords: covariancematrix

### ** Examples

data(iris)
options(contrasts=c("contr.sum","contr.poly"))
iris.lm = lm(as.matrix(iris[,1:4])~iris[,5])
cov.matrix <- CalculateMatrix(iris.lm)

#To obtain a corrlation matrix, use:
cor.matrix <- cov2cor(cov.matrix)



