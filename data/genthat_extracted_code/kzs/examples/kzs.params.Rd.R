library(kzs)


### Name: kzs.params
### Title: Restrictions for KZS Parameters
### Aliases: kzs.params
### Keywords: smooth nonparametric

### ** Examples

# Generate 3 random sequences of numbers that would act as the input data set 
x1 <- rnorm(100, 3, 6)
x2 <- rnorm(100, 4, 5)
x3 <- runif(100, 0, 1)

# A matrix or a data frame will work 
mat <- matrix(c(x1, x2, x3), nrow = 100, ncol = 3)

# Dimensionality is 3 since there are 3 input variables
kzs.params(x = mat, dimension = 3)



