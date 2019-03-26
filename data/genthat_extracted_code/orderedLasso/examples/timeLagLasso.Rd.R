library(orderedLasso)


### Name: timeLagLasso
### Title: Fit a time-lag lasso
### Aliases: timeLagLasso

### ** Examples

set.seed(3)
n = 50
maxlag = 5
num_rows_needed = n + maxlag + 1
sigma = 4
x = matrix(rnorm(num_rows_needed * 4), nrow = num_rows_needed)
x_new = time_lag_matrix(x, maxlag)
b = c(3,1,1,0,0,
      4,1,0,0,0,
      3,2,1,0,0,
      1,0,0,0,0)
y = x_new %*% b + sigma* rnorm(nrow(x_new))
y = as.vector(y)
y = c(y, rnorm(maxlag + 1))
model1 = timeLagLasso(x = x, y = y, lambda =  1, maxlag = maxlag, 
          method = "Solve.QP", strongly.ordered = TRUE)



