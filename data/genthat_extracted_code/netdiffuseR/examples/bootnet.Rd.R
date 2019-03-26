library(netdiffuseR)


### Name: bootnet
### Title: Network Bootstrapping
### Aliases: bootnet resample_graph c.diffnet_bootnet print.diffnet_bootnet
###   hist.diffnet_bootnet

### ** Examples

#
set.seed(13)
g <- rgraph_ba(t=99)

ans <- bootnet(g, function(w, ...) length(w@x), R=100)
ans



