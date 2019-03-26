library(netmeta)


### Name: netdistance
### Title: Calculate distance matrix for an adjacency matrix
### Aliases: netdistance

### ** Examples

data(Senn2013)

net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data = Senn2013, sm = "MD")

netdistance(net1)
netdistance(net1$A.matrix)



