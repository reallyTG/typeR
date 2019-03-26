library(changepointsHD)


### Name: binary_segmentation
### Title: Multiple change-point method.
### Aliases: binary_segmentation binary_segmentation,changepointsMod-method

### ** Examples

set.seed(334)

mcp_data = read.table(system.file("extdata", "mcp.txt", package="changepointsHD"))
mcp_data = as.matrix(mcp_data)

# prox gradient black-box method
cov_est = cov(mcp_data)
init = solve(cov_est)
res_map = prox_gradient_mapping(mcp_data, init, 0.1, 0.99, 0.1, 100, 1e-20)

# prox gradient black-box ll
res_ll = prox_gradient_ll(mcp_data, res_map, 0.1)

prox_gradient_params=list()
prox_gradient_params$update_w = 0.1
prox_gradient_params$update_change = 0.99
prox_gradient_params$regularizer = 0.1
prox_gradient_params$max_iter = 1
prox_gradient_params$tol = 1e-5

prox_gradient_ll_params=list()
prox_gradient_ll_params$regularizer = 0.1

simulated_annealing_params = list()
simulated_annealing_params$buff=10

changepoints_mod = changepointsMod(bbmod=prox_gradient_mapping,
                                 log_likelihood=prox_gradient_ll,
                                 bbmod_params=prox_gradient_params,
                                 ll_params=prox_gradient_ll_params,
                                 part_values=list(init, init),
                                 data=list(mcp_data))

changepoints_mod = binary_segmentation(changepoints_mod, method=simulated_annealing,
                                       thresh=0, buff=10,
                                       method_params=simulated_annealing_params)




