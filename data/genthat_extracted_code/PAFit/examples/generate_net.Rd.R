library(PAFit)


### Name: generate_net
### Title: Simulating networks from preferential attachment and fitness
###   mechanisms
### Aliases: generate_net

### ** Examples

library("PAFit")
#Generate a network from the original BA model with alpha = 1, N = 100, m = 1
net <- generate_net(N = 100,m = 1,mode = 1, alpha = 1, s = 0)
str(net)
plot(net)



