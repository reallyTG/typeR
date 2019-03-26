library(odpc)
context("Compare odpc output with stored values")

T <- 30 #length of series
m <- 10 #number of series
set.seed(1234)
f <- rnorm(T + 1)
x <- matrix(0, T, m)
u <- matrix(rnorm(T * m), T, m)
for (i in 1:m) {
  x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
}
# from odpc 1.0.0
old_mse <- 0.775981
old_B <- rbind(c(0.6047292, 0.2579100, -0.2383648, -0.6071289, -0.72405177, -0.5911932, -0.2396958,  0.2089657,  0.5788413,  0.7264755127),
               c(0.4129345, 0.7099759,  0.7018187,  0.4096304,  0.04051445, -0.4245995, -0.7128675, -0.7038352, -0.4241004, -0.0000175697))
old_a <- c(0.281353097, -0.168680377, -0.365183874, -0.294046511, -0.262466187, -0.244247851,  0.038762303, -0.387626573,  0.416784899,  0.155071336,
          -0.090215542, -0.035780053,  0.131756690, -0.185041501, -0.062290283,  0.005003871, -0.227599030,  0.006187320,  0.268459624, -0.075306478)

fit <- odpc(x, ks = c(1))

test_that('Equality with stored a', {
  expect_equal(fit[[1]]$a, old_a, tolerance=1e-2)
})
test_that('Equality with stored B', {
  expect_equal(fit[[1]]$B, old_B, tolerance=1e-2)
})
test_that('Equality with stored mse', {
  expect_equal(fit[[1]]$mse, old_mse, tolerance=1e-2)
})

