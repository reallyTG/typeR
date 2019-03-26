library(PAFit)


### Name: PAFit-package
### Title: Generative Mechanism Estimation in Temporal Complex Networks
### Aliases: PAFit-package PAFit

### ** Examples

## Not run: 
##D   ### Jointly estimate the attachment function and node fitnesses
##D    library("PAFit")
##D    set.seed(1)
##D   # a Bianconi-Barabasi network 
##D   # size of initial network = 100
##D   # number of new nodes at each time-step = 100
##D   # Ak = k; inverse variance of distribution of fitness: s = 10
##D   net        <- generate_BB(N        = 1000 , m             = 10 , 
##D                             num_seed = 100  , multiple_node = 100,
##D                             s        = 10)
##D   net_stats  <- get_statistics(net)
##D   
##D   #Joint estimation of attachment function Ak and node fitness
##D   result     <- joint_estimate(net, net_stats)
##D   
##D   summary(result)
##D   
##D   # plot the estimated attachment function
##D   plot(result, net_stats)
##D   
##D   # true function
##D   true_A     <- pmax(result$estimate_result$center_k,1)
##D   lines(result$estimate_result$center_k, true_A, col = "red") # true line
##D   legend("topleft" , legend = "True function" , col = "red" , lty = 1 , bty = "n")
##D   #plot distribution of estimated node fitnesses
##D   plot(result, net_stats, plot = "f")
##D   
##D   #plot the estimated node fitnesses and true node fitnesses
##D   plot(result, net_stats, true = net$fitness, plot = "true_f")
## End(Not run)



