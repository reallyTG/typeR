library(ordPens)


### Name: ordSelect
### Title: Selection and smoothing of dummy coefficients of ordinal
###   predictors
### Aliases: ordSelect
### Keywords: models regression

### ** Examples

# smoothing and selection of ordinal covariates using a random dataset
set.seed(123)

# generate (ordinal) predictors
x1 <- sample(1:8,100,replace=TRUE)
x2 <- sample(1:6,100,replace=TRUE)
x3 <- sample(1:7,100,replace=TRUE)

# the response
y <- -1 + log(x1) + sin(3*(x2-1)/pi) + rnorm(100)

# x matrix
x <- cbind(x1,x2,x3)

# lambda values
lambda <- c(1000,500,200,100,50,30,20,10,1)

# smoothing and selection
o2 <- ordSelect(x = x, y = y, lambda = lambda)

# results
round(o2$coef,digits=3)
plot(o2)

# If for a certain plot the x-axis should be annotated in a different way,
# this can (for example) be done as follows:
plot(o2, whichx = 1, xlim = c(0,9), xaxt = "n")
axis(side = 1, at = c(1,8), labels = c("no agreement","total agreement"))



