library(changepointsHD)


### Name: brute_force
### Title: Single change-point brute force method.
### Aliases: brute_force brute_force,changepointsMod-method

### ** Examples

set.seed(334)

scp_data = read.table(system.file("extdata", "scp.txt", package="changepointsHD"))
scp_data = as.matrix(scp_data)

# prox gradient black-box method
cov_est = cov(scp_data)
init = solve(cov_est)
res_map = prox_gradient_mapping(scp_data, init, 0.1, 0.99, 0.1, 100, 1e-20)

# prox gradient black-box ll
res_ll = prox_gradient_ll(scp_data, res_map, 0.1)

prox_gradient_params=list()
prox_gradient_params$update_w = 0.1
prox_gradient_params$update_change = 0.99
prox_gradient_params$regularizer = 0.1
prox_gradient_params$max_iter = 1
prox_gradient_params$tol = 1e-5

prox_gradient_ll_params=list()
prox_gradient_ll_params$regularizer = 0.1

changepoints_mod = changepointsMod(bbmod=prox_gradient_mapping,
                                 log_likelihood=prox_gradient_ll,
                                 bbmod_params=prox_gradient_params,
                                 ll_params=prox_gradient_ll_params,
                                 part_values=list(init, init),
                                 data=list(scp_data))
changepoints_mod = brute_force(changepoints_mod, buff=10)




