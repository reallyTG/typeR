library(spacodiR)


### Name: phy.nodetimes
### Title: finding splitting times for nodes
### Aliases: phy.nodetimes

### ** Examples

## an example of comparing observed and expected Bst at nodes ##
data(sp.example)
attach(sp.example)
s=spl
p=phy

# get nodes for a time-slice
n.t=phy.nodetimes(phy=p,time.range=c(0.25,0.75))

# get Bsts for nodes
o=spacodi.by.nodes(sp.plot=s, phy=p, obs.only=TRUE)[[1]]
obs=o[!is.na(match(o[,"node.ID"], names(n.t))),1]

# compile expected Bst-values from data reshuffling
spacodi.by.nodes(sp.plot=s, phy=p, n.rep=5, method="1s")[[2]]->exps
e=exps[!is.na(match(row.names(exps), names(n.t))),]
exp=unname(unlist(e))

# randomization test of observed and expected Bst
resamp.test(obs=obs, exp=exp, iter=100, two.tailed=TRUE)



