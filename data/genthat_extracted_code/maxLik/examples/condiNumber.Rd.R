library(maxLik)


### Name: condiNumber
### Title: Print matrix condition numbers column-by-column
### Aliases: condiNumber condiNumber.default condiNumber.maxLik
### Keywords: math utilities debugging

### ** Examples

   set.seed(0)
   ## generate a simple nearly multicollinear dataset
   x1 <- runif(100)
   x2 <- runif(100)
   x3 <- x1 + x2 + 0.000001*runif(100) # this is virtually equal to x1 + x2
   x4 <- runif(100)
   y <- x1 + x2 + x3 + x4 + rnorm(100)
   m <- lm(y ~ -1 + x1 + x2 + x3 + x4)
   print(summary(m)) # note the outlandish estimates and standard errors
                     # while R^2 is 0.88. This suggests multicollinearity
   condiNumber(model.matrix(m))   # note the value 'explodes' at x3
   ## we may test the results further:
   print(summary(lm(x3 ~ -1 + x1 + x2)))
   # Note the extremely high t-values and R^2: x3 is (almost) completely
   # explained by x1 and x2



