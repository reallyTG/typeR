library(PAFit)


### Name: to_networkDynamic
### Title: Convert a PAFit_net object to a networkDynamic object
### Aliases: to_networkDynamic

### ** Examples

  library("PAFit")
  # a network from Bianconi-Barabasi model
  net          <- generate_BB(N = 50 , m = 10 , s = 10)
  nD_graph     <- to_networkDynamic(net)



