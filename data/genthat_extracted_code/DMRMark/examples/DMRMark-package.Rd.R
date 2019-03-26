library(DMRMark)


### Name: DMRMark-package
### Title: DMR Detection by Non-Homogeneous Hidden Markov Model from
###   Methylation Array Data
### Aliases: DMRMark-package
### Keywords: package

### ** Examples

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
	set.seed(0)
	par <- DMRMark(mv, L, starting)
	
	# Get the posterior of being certain states
	# Return the result of DMC for plotting by setting 'region=FALSE'
	results <- DMRViterbi(mv, par, L, starting, region=FALSE)
	
	# The MAP states being 3 or 4 indicate DMCs
	isDMC <- (results$states > 2) + 0
	mvScatter(mv, isDMC, nPlot=10000)



