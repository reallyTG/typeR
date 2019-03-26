library(qad)


### Name: emp_c_copula
### Title: The empirical checkerboard copula
### Aliases: emp_c_copula emp_c_copula_eval

### ** Examples

## Generate data X from the product copula and compute the empirical copula
n <- 1000
x <- runif(n, 0, 1)
y <- runif(n, 0, 1)
X <- data.frame(x,y)
#(Not Run)
# mass_product <- emp_c_copula(X, smoothing = TRUE, resolution = 50)
# eval_points <- data.frame(x = c(0.3,0.6), y = c(0.5,0.9))
# eval_points$emp_cop <- emp_c_copula_eval(X, eval_points, smoothing = TRUE, resolution = 50)
# eval_points$cop <- eval_points$x * eval_points$y

## Compute empirical checkerboard copula of a sample with ties and plot density
n <- 1000
x <- sample(runif(n, -1, 1), n, replace=TRUE)
y <- x^2 + rnorm(n, 0, 1)
X <- data.frame(x,y)
#(Not Run)
# mass <- emp_c_copula(X, smoothing = TRUE, resolution = 10)
# plot_density(mass)



