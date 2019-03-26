library(BDgraph)


### Name: BDgraph-package
### Title: Bayesian Structure Learning in Graphical Models
### Aliases: BDgraph-package BDgraph ' compute_tp_fp ' ' compute_measures '
###   ' hill_climb_mpl ' ' local_mb_hc ' ' global_hc ' ' log_mpl_disrete '
###   ' hill_climb_mpl_binary ' ' local_mb_hc_binary ' ' global_hc_binary '
###   ' log_mpl_binary ' ' detect_cores ' ' check.os ' ' sample_ug ' '
###   generate_clique_factors ' ' calc_joint_dist '
### Keywords: Package, BDgraph, Bayesian Structure Learning, Gaussian
###   Graphical Models, Gaussian Copula Graphical Models, BDMCMC,
###   G-Wishart, Marginal Pseudo-likelihood

### ** Examples

## Not run: 
##D library( BDgraph )
##D 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 70, p = 6, size = 7, vis = TRUE )
##D 
##D # Running algorithm based on GGMs
##D bdgraph.obj <- bdgraph( data = data.sim, iter = 5000 )
##D 
##D summary( bdgraph.obj )
##D 
##D # To compare the result with true graph
##D compare( data.sim, bdgraph.obj, main = c( "True graph", "BDgraph" ), vis = TRUE )
##D 
##D # Running algorithm based on GGMs and marginal pseudo-likelihood
##D bdgraph.obj_mpl <- bdgraph.mpl( data = data.sim, iter = 5000 )
##D 
##D summary( bdgraph.obj_mpl )
##D 
##D # To compare the results of both algorithms with true graph
##D compare( data.sim, bdgraph.obj, bdgraph.obj_mpl, 
##D          main = c( "True graph", "BDgraph", "BDgraph_mpl" ), vis = TRUE )
## End(Not run)



