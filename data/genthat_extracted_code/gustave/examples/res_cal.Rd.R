library(gustave)


### Name: res_cal
### Title: Linear Regression Residuals Calculation
### Aliases: res_cal

### ** Examples

# Generating random data
set.seed(1)
n <- 100
H <- 5
y <- matrix(rnorm(2*n), nrow = n)
x <- matrix(rnorm(10*n), nrow = n)
by <- letters[sample(1:H, n, replace = TRUE)]

# Direct calculation
res_cal(y, x)

# Calculation with pre-calculated data
precalc <- res_cal(y = NULL, x)
res_cal(y, precalc = precalc)
identical(res_cal(y, x), res_cal(y, precalc = precalc))

# Matrix::TsparseMatrix capability
require(Matrix)
X <- as(x, "TsparseMatrix")
Y <- as(y, "TsparseMatrix")
identical(res_cal(y, x), as.matrix(res_cal(Y, X)))

# by parameter for within by-groups calculation
res_cal(Y, X, by = by)
identical(
 res_cal(Y, X, by = by)[by == "a", ],
  res_cal(Y[by == "a", ], X[by == "a", ])
)




