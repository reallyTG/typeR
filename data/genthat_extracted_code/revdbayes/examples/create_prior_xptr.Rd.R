library(revdbayes)


### Name: create_prior_xptr
### Title: Create an external pointer to a C++ prior
### Aliases: create_prior_xptr

### ** Examples

ptr_gp_flat <- create_prior_xptr("gp_flat")
prior_cfn <- set_prior(prior = ptr_gp_flat, model = "gp", min_xi = -1)

ptr_gev_flat <- create_prior_xptr("gev_flat")
prior_cfn <- set_prior(prior = ptr_gev_flat, model = "gev", min_xi = -1,
                       max_xi = Inf)

mat <- diag(c(10000, 10000, 100))
ptr_gev_norm <- create_prior_xptr("gev_norm")
pn_u <- set_prior(prior = ptr_gev_norm, model = "gev", mean = c(0,0,0),
                  icov = solve(mat))



