library(selac)


### Name: SelacSimulator
### Title: Simulate DNA under the SELAC model
### Aliases: SelacSimulator

### ** Examples

## No test: 
data(yeast)
system(paste("mkdir", "fastaSet", sep=" "))
sim.dat <- SelacSimulator(phy=phy, pars=model.fit$mle.pars[1,], aa.optim_array=
	model.fit$aa.optim[[1]], codon.freq.by.aa=model.fit$codon.freq.by.aa[[1]], 
	codon.freq.by.gene=model.fit$codon.freq.by.gene[[1]], nuc.model=model.fit$nuc.model)
write.dna(sim.dat, file=paste("fastaSet", "/gene",  "TEST", ".fasta", sep=""), 
	format="fasta", colw=1000000)
## End(No test)



