library(PAFit)


### Name: plot.PA_result
### Title: Plotting the estimated attachment function
### Aliases: plot.PA_result

### ** Examples

  library("PAFit")
  net        <- generate_net(N = 1000 , m = 1 , mode = 1 , alpha = 1 , s = 0)
  net_stats  <- get_statistics(net)
  result     <- Newman(net, net_stats)
  # true function
  true_A     <- result$center_k
  # plot the estimated attachment function
  plot(result , net_stats)
  lines(result$center_k, true_A, col = "red") # true attachment function
  legend("topleft" , legend = "True function" , col = "red" , lty = 1 , bty = "n")



