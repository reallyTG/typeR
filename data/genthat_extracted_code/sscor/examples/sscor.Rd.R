library(sscor)


### Name: sscor
### Title: Spatial sign correlation
### Aliases: sscor

### ** Examples


set.seed(5)
X <- cbind(rnorm(25),rnorm(25))
# X is a 25x2 matrix

# cor() and sscor() behave similar under normality
sscor(X)
cor(X)

# but behave differently in the presence of outliers.
X[1,] <- c(10,10)
sscor(X)
cor(X) 




