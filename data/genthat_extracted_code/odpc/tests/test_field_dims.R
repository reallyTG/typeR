library(odpc)
context("Test that function to build fields gets dimensions right")

set.seed(1234)
N <- 50 #length of series
m <- 50 #number of series
set.seed(1234)
f <- rnorm(N + 1)
x_small <- matrix(0, N, m)
u <- matrix(rnorm(N * m), N, m)
for (i in 1:m) {
  x_small[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:N] + 10 * cos(2 * pi * (i/m)) * f[2:(N + 1)] + u[, i]
}

hs <- c(1, 3)
window_size <- 10
k_list <- c(1, 2)

for (h in hs){
  test_that(paste0("Correct dimensions, first component for m=T"), {
  data_field <- build_data_field(Z=x_small, h=h, window_size = window_size)
  nrows <- sapply(data_field, nrow)
  expect_equal(nrows, N - h - 0:(window_size-1))
  })
}

for (h in hs){
  test_that(paste0("Correct dimensions, second component for m=T"), {
    data_field <- build_data_field(Z=x_small, h=h, window_size = window_size)
    response_field <- build_response_field(data_field=data_field, k_trun = 2 * k_list)
    output <- grid_odpc(data_field=data_field, response_field=response_field, num_comp=1,
                        k_maxs=2*k_list, k_list=k_list, window_size = window_size, tol=1e-2, niter_max=100, method=2)
    data_field <- build_data_field(output[[2]])
    nrows <- sapply(data_field, nrow)
    expect_equal(nrows, N - h - 0:(window_size-1) - 2 * k_list[2])
  })
}