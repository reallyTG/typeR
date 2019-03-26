library(PAFit)


### Name: print.PA_result
### Title: Printing information of the estimated attachment function
### Aliases: print.PA_result

### ** Examples

  library("PAFit")
  net        <- generate_net(N = 1000 , m = 1 , mode = 1 , alpha = 1 , s = 0)
  net_stats  <- get_statistics(net)
  result     <- Newman(net, net_stats)
  print(result)



