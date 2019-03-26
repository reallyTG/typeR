library(PAFit)


### Name: summary.CV_Result
### Title: Output summary information of the cross-validation result
### Aliases: summary.CV_Result

### ** Examples

  ## Since the runtime is long, we do not let this example run on CRAN
  ## Not run: 
##D     library("PAFit")
##D     set.seed(1)
##D     # a network from Bianconi-Barabasi model
##D     net        <- generate_BB(N        = 1000 , m             = 50 , 
##D                               num_seed = 100  , multiple_node = 100,
##D                               s        = 10)
##D     net_stats  <- get_statistics(net)
##D     result     <- joint_estimate(net, net_stats)
##D     summary(result$cv_result)
##D   
## End(Not run)



