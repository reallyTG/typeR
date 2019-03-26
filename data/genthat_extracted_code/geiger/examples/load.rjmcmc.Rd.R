library(geiger)


### Name: load.rjmcmc
### Title: posterior samples from single or multiple MCMC runs
### Aliases: load.rjmcmc
### Keywords: data manip

### ** Examples

## No test: 
sal=get(data(caudata))
a<-sim<-sal$phy
bl=c(386,387,388,183,184,185,186)
mod=match(bl, sim$edge[,2])
sim$edge.length[mod]=sim$edge.length[mod]*64
dat=rTraitCont(sim)
while(1){
	b=a
	b$tip.label[183:186]=sample(b$tip.label[183:186])
	if(!all(a$tip.label==b$tip.label)) break()
}

trees=list(a=a,b=b, c=ladderize(a, right=TRUE), d=ladderize(a, right=FALSE))
class(trees)="multiPhylo"
rjmcmc.bm(trees, dat, ngen=1e3, type="rbm")

res=load.rjmcmc(paste("relaxedBM", names(trees), sep="."), phy=trees$d, burnin=0.25)
plot(res, par="shifts", show.tip=FALSE, edge.width=2.5)
## End(No test)



