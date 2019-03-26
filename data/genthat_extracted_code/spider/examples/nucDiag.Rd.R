library(spider)


### Name: nucDiag
### Title: Nucleotide diagnostics for species alignments
### Aliases: nucDiag

### ** Examples


data(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
	function(x) paste(x[1], x[2], sep="_"))

nucDiag(anoteropsis, anoSpp)


#To view the nucleotide values 
anoNuc <- nucDiag(anoteropsis, anoSpp)
as.character(anoteropsis[ ,anoNuc[[1]][1] ])



data(sarkar)
sarkarSpp <- substr(dimnames(sarkar)[[1]], 1, 3)
nucDiag(sarkar, sarkarSpp)

## Not run: 
##D rnucDiag(anoteropsis, anoSpp, n = 100)
## End(Not run)




