library(PAFit)


### Name: print.CV_Data
### Title: Printing simple information of the cross-validation data
### Aliases: print.CV_Data

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
##D     print(result$cv_data)
##D   
## End(Not run)



