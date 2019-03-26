library(PAFit)


### Name: from_networkDynamic
### Title: Convert a networkDynamic object to a PAFit_net object
### Aliases: from_networkDynamic

### ** Examples

library("PAFit")
# a network from Bianconi-Barabasi model
net          <- generate_BB(N = 50 , m = 10 , s = 10)
nD_graph     <- to_networkDynamic(net)
back         <- from_networkDynamic(nD_graph)



