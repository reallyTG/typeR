library(PAFit)


### Name: print.PAFit_data
### Title: Printing simple information on the statistics of the network
###   stored in a 'PAFit_data' object
### Aliases: print.PAFit_data

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
##D     print(net_stats)
##D   
## End(Not run)



