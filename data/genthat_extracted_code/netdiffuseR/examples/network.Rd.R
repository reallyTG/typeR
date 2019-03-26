library(netdiffuseR)


### Name: network
### Title: Coercion between 'diffnet', 'network' and 'networkDynamic'
### Aliases: network networkDynamic diffnet_to_network
###   diffnet_to_networkDynamic networkDynamic_to_diffnet
###   network_to_diffnet

### ** Examples

# Cohersing a diffnet to a list of networks ---------------------------------
set.seed(1)
ans <- diffnet_to_network(rdiffnet(20, 2))
ans

# and back
network_to_diffnet(graph.list = ans, toavar="toa")

# If it was static, we can use -graph- instead
network_to_diffnet(ans[[1]], toavar="toa")

# A random diffusion network ------------------------------------------------
set.seed(87)
dn  <- rdiffnet(50, 4)
ans <- diffnet_to_networkDynamic(dn)

# and back
networkDynamic_to_diffnet(ans, toavar = "toa")




