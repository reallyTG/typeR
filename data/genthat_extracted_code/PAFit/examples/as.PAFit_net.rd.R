library(PAFit)


### Name: as.PAFit_net
### Title: Converting an edgelist matrix to a PAFit_net object
### Aliases: as.PAFit_net

### ** Examples

library("PAFit")
# a network from Bianconi-Barabasi model
net        <- generate_BB(N = 50 , m = 10 , s = 10)
as.PAFit_net(net$graph)



