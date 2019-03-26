library(odpc)
context("Test loop for building optimal odpcs over rolling window")

set.seed(1234)
N <- 50 #length of series
m <- 50 #number of series
f <- rnorm(N + 1)
x_small <- matrix(0, N, m)
u <- matrix(rnorm(N * m), N, m)
for (i in 1:m) {
  x_small[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:N] + 10 * cos(2 * pi * (i/m)) * f[2:(N + 1)] + u[, i]
}

h <- 2
window_size <- 4
k_list <- c(2, 1, 3)
tol <- 1e-2
niter_max <- 20
ncores <- 1
method <- 2
num_comp <- 1
ks <- c()

data_field <- build_data_field(Z=x_small, window_size = window_size, h = h)
response_field <- build_response_field(data_field=data_field, k_trun = 2 * k_list)

fits <- grid_odpc(data_field = data_field, response_field = response_field,
                  num_comp = num_comp, k_list=k_list, k_maxs=2 * k_list, window_size=window_size, tol=tol,
                  niter_max=niter_max, method=method, ncores_w=ncores)

best_fit <- get_best_fit(fits, Z=x_small, h=h, window_size = window_size)
opt_comp <- best_fit$opt_comp
new_best_mse <- best_fit$opt_mse
new_opt_k <- k_list[best_fit$opt_ind]
ks <- c(ks, new_opt_k)
updated_k_params <- update_k_params(ks=ks, k_list=k_list)
k_maxs <- updated_k_params$k_maxs
k_trun <- updated_k_params$k_trun
current_k_max <- updated_k_params$current_k_max

while (num_comp <= 2){
  # response field is now formed by the residuals from the fit using the current optimal componentss
  residual_field <- build_data_field(opt_comp)
  response_field <- build_response_field(data_field=residual_field, k_trun=k_trun)
  # compute another component using the previous fitted ones
  fits <- grid_odpc(data_field = data_field, response_field = response_field,
                    num_comp = num_comp + 1, k_list=k_list, k_maxs=k_maxs, window_size=window_size, tol=tol,
                    niter_max=niter_max, method=method, ncores_w=ncores)
  # append to current components the new fitted ones; extended fits has one entry per k; each of these
  # entries has window_size entries; in each of these we have: the current optimal component computed along the
  # rolling window, with the latest component appended at the end
  extended_fits <- new_window_object(fits, opt_comp)
  
  # get the optimal k for the new component
  best_fit <- get_best_fit(extended_fits, Z=x_small, h=h, window_size = window_size)
  
  opt_comp <- best_fit$opt_comp
  
  old_best_mse <- new_best_mse
  new_best_mse <- best_fit$opt_mse
  new_opt_k <- k_list[best_fit$opt_ind]
  ks <- c(ks, new_opt_k)
  num_comp <- length(ks)
  updated_k_params <- update_k_params(ks=ks, k_list=k_list)
  k_maxs <- updated_k_params$k_maxs
  k_trun <- updated_k_params$k_trun
  current_k_max <- updated_k_params$current_k_max
}

for (icomp in 1:3){
  for (t in 1:window_size){
      comp <- opt_comp[[t]] 
      comp <- construct.odpcs(comp, data=x_small, fn_call=match.call(mean))
      N_t <- nrow(data_field[[t]])
      min_recon <- 2 * max(ks[1:icomp])+1
      mse_3comp <- mean((data_field[[t]][min_recon:N_t,] - fitted(comp, num_comp = icomp))**2)
      test_that(paste0('Correct mse for w=', t, 'component number', icomp), {
      expect_lte(abs(1- mse_3comp/comp[[icomp]]$mse), 2e-2)
      })
  }
}


