library(Rknots)


### Name: loadProtein
### Title: Import a pdb file or fetch it from the Protein Data Bank. Check
###   for structural gaps. Build and return a backbone trace for each
###   polypeptide chain.
### Aliases: loadProtein
### Keywords: utilities proteins

### ** Examples

## Not run: 
##D ## Loading from the file system
##D fn <- system.file("extdata", "1AJC_chainA.pdb", package="Rknots")
##D protein <- loadProtein(fn)
##D 
##D ## Fetching the PDB
##D protein<- loadProtein('2K0A')
##D #more than one chain (notice the split)
##D protein <- loadProtein('1GZ0')
##D str(protein)
##D 
##D #A protein with two subunits. The first one is split in two subchains.
##D protein <- loadProtein('1AJC', join.gaps = FALSE, cutoff = 7)
##D str(protein)
## End(Not run)



