library(PAFit)


### Name: plot.Full_PAFit_result
### Title: Plotting the estimated attachment function and node fitness
### Aliases: plot.Full_PAFit_result

### ** Examples

## Since the runtime is long, we do not let this example run on CRAN
## Not run: 
##D library("PAFit")
##D set.seed(1)
##D # a network from Bianconi-Barabasi model
##D net        <- generate_BB(N        = 1000 , m             = 50 , 
##D                           num_seed = 100  , multiple_node = 100,
##D                           s        = 10)
##D net_stats  <- get_statistics(net)
##D result     <- joint_estimate(net, net_stats)
##D #plot A
##D plot(result , net_stats , plot = "A")
##D true_A     <- c(1,result$estimate_result$center_k[-1])
##D lines(result$estimate_result$center_k + 1 , true_A , col = "red") # true line
##D legend("topleft" , legend = "True function" , col = "red" , lty = 1 , bty = "n")
##D #plot true_f
##D plot(result, net_stats , net$fitness, plot = "true_f")
## End(Not run)



