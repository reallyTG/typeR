library(PAFit)


### Name: only_A_estimate
### Title: Estimating the attachment function in isolation by PAFit method
### Aliases: only_A_estimate

### ** Examples

## Not run: 
##D   library("PAFit")
##D   # a network from BA model
##D   net        <- generate_BB(N = 1000 , m = 1 , mode = 1)
##D   
##D   net_stats  <- get_statistics(net)
##D   result     <- only_A_estimate(net, net_stats)
##D  
##D   # plot the estimated attachment function
##D   plot(result, net_stats)
##D   
##D   # true function
##D   true_A     <- result$estimate_result$center_k
##D   lines(result$estimate_result$center_k, true_A, col = "red") # true line
##D   legend("topleft" , legend = "True function" , col = "red" , lty = 1 , bty = "n")
##D   
## End(Not run)



