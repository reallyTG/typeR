library(spacodiR)


### Name: resamp.test
### Title: statistical comparison of sets of values by randomization
### Aliases: resamp.test

### ** Examples


## A GENERAL EXAMPLE
# a comparison between two distributions
a=rnorm(n=1000, mean=1, sd=0.5)
b=rnorm(n=1000, mean=0, sd=1)
resamp.test(obs=a, exp=b, two.tailed=FALSE)

# a comparison of a single value to a normal distribution
a=3
b=rnorm(n=1000, mean=0, sd=1)
resamp.test(obs=a, exp=b, two.tailed=FALSE)

# compare above result with ecdf(), in which we compute an empirical 
f=ecdf(b)
print(1-f(a))		# analogous to a one-tailed test as above

## A COMMUNITY PHYLOGENETIC EXAMPLE
## an example of comparing observed and expected Bst at nodes ##
data(sp.example)
attach(sp.example)
s=spl
p=phy

# get nodes for a time-slice
n.t=phy.nodetimes(phy=p,time.range=c(0.25, 0.75))

# get Bsts for nodes
o=spacodi.by.nodes(sp.plot=s, phy=p, obs.only=TRUE)[[1]]
obs=o[!is.na(match(o[,"node.ID"], names(n.t))),1]

# compile expected Bst-values from data reshuffling
spacodi.by.nodes(sp.plot=s, phy=p, n.rep=5, method="1s")[[2]]->exps
e=exps[!is.na(match(row.names(exps), names(n.t))),]
exp=unname(unlist(e))

# randomization test of observed and expected Bst
resamp.test(obs=obs, exp=exp, iter=100, two.tailed=TRUE)



