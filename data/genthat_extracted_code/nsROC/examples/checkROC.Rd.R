library(nsROC)


### Name: checkROC
### Title: Check data to compute an ROC curve
### Aliases: checkROC

### ** Examples

# Basic example with full information
set.seed(123)
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))
checkROC(X,D)

# Example with some missing values and more than two levels
X <- replace(c(rnorm(25), rnorm(30,2,1.5), rnorm(20,-3,1)), seq(1,75,5), NA)
D <- replace(c(rep(0,25), rep(1,30), rep(2,20)), seq(1,75,11), NA)
checkROC(X,D)



