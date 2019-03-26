library(selac)


### Name: SelacOptimize
### Title: Efficient optimization of the SELAC model
### Aliases: SelacOptimize selac

### ** Examples

## No test: 
data(yeast)
system(paste("mkdir", "fastaSet", sep=" "))
sim.dat <- SelacSimulator(phy=phy, pars=model.fit$mle.pars[1,], aa.optim_array=
	model.fit$aa.optim[[1]], codon.freq.by.aa=model.fit$codon.freq.by.aa[[1]], 
	codon.freq.by.gene=model.fit$codon.freq.by.gene[[1]], nuc.model=model.fit$nuc.model)
write.dna(sim.dat, file=paste("fastaSet", "/gene",  "TEST", ".fasta", sep=""), 
	format="fasta", colw=1000000)
pp <- SelacOptimize(codon.data.path="fastaSet/", phy=phy, 
	data.type="codon", nuc.model="GTR", include.gamma=TRUE, n.cores.by.gene=3)
## End(No test)



