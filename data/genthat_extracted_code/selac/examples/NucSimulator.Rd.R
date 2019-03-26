library(selac)


### Name: NucSimulator
### Title: Simulate DNA under General-Time Reversible model
### Aliases: NucSimulator

### ** Examples

## No test: 
pp <- SelacOptimize(codon.data.path="FOLDER_WITH_FASTA/", phy=phy, 
	data.type='nucleotide', optimal.aa='none', codon.model='none', nuc.model='GTR', 
	include.gamma=TRUE, gamma.type='quadrature')
sim.dat <- NucSimulator(phy=pp$phy, pars=pp$mle.pars, nsites=pp$nsites, nuc.model=pp$nuc.model)
## End(No test)



