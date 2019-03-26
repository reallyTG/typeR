library(wfg)


### Name: network.simu
### Title: Simulation of Networks with Community Structures
### Aliases: network.simu

### ** Examples


## simulation of a network with four communities, each with size 32

library(wfg)
nv = c(32, 32, 32, 32)
p.in = c(0.452, 0.452, 0.452, 0.452)
p.out = 0.021
p.del = 0
net.simu <- network.simu(nv=nv, p.in=p.in, p.out=p.out, p.del=p.del)
net <- net.simu$net
group <- net.simu$group

## plot simulated network with vertices colored by membership

V(net)$size <- 7
V(net)$color <- group
plot(net, vertex.label='')




