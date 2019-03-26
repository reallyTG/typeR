library(c3net)


### Name: c3net
### Title: All in one function to infer network with C3NET
### Aliases: c3net
### Keywords: misc

### ** Examples

data(expdata)
data(truenet)

net <- c3net(expdata, network=TRUE)
scores <- checknet(net,truenet)



