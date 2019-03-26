library(PAFit)


### Name: joint_estimate
### Title: Joint inference of attachment function and node fitnesses
### Aliases: joint_estimate

### ** Examples

## Not run: 
##D   library("PAFit")
##D   # size of initial network = 100
##D   # number of new nodes at each time-step = 100
##D   # Ak = k; inverse variance of the distribution of node fitnesse = 5
##D   net        <- generate_BB(N        = 1000 , m             = 50 , 
##D                             num_seed = 100  , multiple_node = 100,
##D                             s        = 5)
##D   net_stats  <- get_statistics(net)
##D   
##D   # Joint estimation of attachment function Ak and node fitness
##D   result     <- joint_estimate(net, net_stats)
##D   
##D   summary(result)
##D   
##D   # plot the estimated attachment function
##D   plot(result , net_stats)
##D   
##D   # true function
##D   true_A     <- pmax(result$estimate_result$center_k,1)
##D   lines(result$estimate_result$center_k, true_A, col = "red") # true line
##D   legend("topleft" , legend = "True function" , col = "red" , lty = 1 , bty = "n")
##D   
##D   # plot distribution of estimated node fitnesses
##D   plot(result , net_stats, plot = "f")
##D   
##D   # plot the estimated node fitnesses and true node fitnesses
##D   plot(result, net_stats, true = net$fitness, plot = "true_f")
##D   
## End(Not run)



