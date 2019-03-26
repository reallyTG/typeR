library(DMRMark)


### Name: DMRMark
### Title: Gibbs Sampler to estimate model parameters
### Aliases: DMRMark

### ** Examples


	# DMRMark
	# DMR detection performed on chr18 of a small BLCA dataset from TCGA
	data(BLCA)
	
	# Use a small subset
	nprobe <- 500 
	# M-values
	mv <- BLCA$mv[1:nprobe,]
	
	# Distance between probes, L<0 indicates acorssing chromosomes 
	L = BLCA$distance[1:nprobe]
	
	# Initialize new chain when probe distance too long 
	# or across different chromosomes
	newChains <- which((L > 100000) | L < 0)
	# The starting positions of new chains
	starting <- c(1, newChains[-length(newChains)]+1)
	
	# Run DMRMark with default options
	pars <- DMRMark(mv, L, starting)
	pars



