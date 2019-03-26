library(Rknots)


### Name: findGaps
### Title: Find gaps in proteins based on euclidean distance between
###   residues of the backbone
### Aliases: findGaps
### Keywords: utilities proteins

### ** Examples

## Import a PDB file from the file system
if(require(bio3d)) {
	fn <- system.file("extdata", "1AJC_chainA.pdb", package="Rknots")
	protein <- loadProtein(fn, join.gaps = TRUE)
	str(protein)
	protein.g <- findGaps(protein$A, cutoff = 7)
	str(protein.g)
}



