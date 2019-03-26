library(PAFit)


### Name: only_F_estimate
### Title: Estimating node fitnesses in isolation
### Aliases: only_F_estimate

### ** Examples

## Not run: 
##D   library("PAFit")
##D   set.seed(1)
##D   # size of initial network = 100
##D   # number of new nodes at each time-step = 100
##D   # Ak = k; inverse variance of the distribution of node fitnesse = 10
##D   net        <- generate_BB(N        = 1000 , m             = 50 , 
##D                             num_seed = 100  , multiple_node = 100,
##D                             s        = 10)
##D                             
##D   net_stats  <- get_statistics(net)
##D   
##D   # estimate node fitnesses in isolation, assuming Ak = k
##D   result     <- only_F_estimate(net, net_stats)
##D  
##D   # plot the estimated node fitnesses and true node fitnesses
##D   plot(result, net_stats, true = net$fitness, plot = "true_f")
##D   
## End(Not run)



