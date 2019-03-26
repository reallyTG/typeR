library(selac)


### Name: SelonOptimize
### Title: Optimize parameters under the SELON model
### Aliases: SelonOptimize

### ** Examples

## No test: 
system(paste("mkdir", "uceSet", sep=" "))
sim.dat <- SelonSimulator(phy=phy, pars=model.fit$pars.sims[1,], 
	nuc.optim_array=model.fit$optimal.nuc.list[[1]], nuc.model=model.fit$nuc.model, 
	diploid=TRUE)
write.dna(sim.dat, file=paste("uceSet", "/gene",  "TEST", ".fasta", sep=""), 
	format="fasta", colw=1000000)
pp <- SelonOptimize(nuc.data.path="uceSet/", phy=phy, nuc.model="GTR", n.cores=3)
## End(No test)



