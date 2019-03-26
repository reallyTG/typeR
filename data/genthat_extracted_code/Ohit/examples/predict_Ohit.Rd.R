library(Ohit)


### Name: predict_Ohit
### Title: Make predictions based on a fitted "Ohit" object
### Aliases: predict_Ohit

### ** Examples

# Example setup (Example 3 in Section 5 of Ing and Lai (2011))
n = 410
p = 4000
q = 10
beta_1q = c(3, 3.75, 4.5, 5.25, 6, 6.75, 7.5, 8.25, 9, 9.75)
b = sqrt(3/(4 * q))

x_relevant = matrix(rnorm(n * q), n, q)
d = matrix(rnorm(n * (p - q), 0, 0.5), n, p - q)
x_relevant_sum = apply(x_relevant, 1, sum)
x_irrelevant = apply(d, 2, function(a) a + b * x_relevant_sum)
X = cbind(x_relevant, x_irrelevant)
epsilon = rnorm(n)
y = as.vector((x_relevant %*% beta_1q) + epsilon)

# with intercept
fit1 = Ohit(X[1:400, ], y[1:400])
predict_Ohit(fit1, rbind(X[401:401, ]))
predict_Ohit(fit1, X[401:410, ])
# without intercept
fit2 = Ohit(X[1:400, ], y[1:400], intercept = FALSE)
predict_Ohit(fit2, rbind(X[401:401, ]))
predict_Ohit(fit2, X[401:410, ])



