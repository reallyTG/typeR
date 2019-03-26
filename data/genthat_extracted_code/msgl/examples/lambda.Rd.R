library(msgl)


### Name: lambda
### Title: Computes a lambda sequence for the regularization path
### Aliases: lambda

### ** Examples

data(SimData)

# A quick look at the data
dim(x)
table(classes)

lambda <- msgl::lambda(x, classes, alpha = .5, d = 100, lambda.min = 0.01)



