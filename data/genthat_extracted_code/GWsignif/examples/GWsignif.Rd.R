library(GWsignif)


### Name: GWsignif
### Title: Estimating Genome-Wide Significance for Whole Genome Sequencing
###   Studies, Either Single SNP Tests or Region-Based Tests
### Aliases: GWsignif

### ** Examples

nr <- 100
nSubgenome <- 3
pvalues <- NULL
for (i in 1:nSubgenome){
	nc <- round(runif(1, 1000, 1500))
	dat <- matrix(runif(nr*nc), nr, nc)
	write.table(dat, file = paste0("testdata", i, ".txt"), 
		row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")
	pvalues <- cbind(pvalues, dat)
	}

pvaluefiles <- paste0("testdata", 1:nSubgenome, ".txt")

ptm <- proc.time()
s <- GWsignif(pvalues)
	proc.time() - ptm
	s$mlogq

ptm <- proc.time()
sf <- GWsignif(files = pvaluefiles)
	proc.time() - ptm
	sf$mlogq




