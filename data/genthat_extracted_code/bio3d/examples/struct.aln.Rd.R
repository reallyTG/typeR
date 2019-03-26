library(bio3d)


### Name: struct.aln
### Title: Structure Alignment Of Two PDB Files
### Aliases: struct.aln
### Keywords: utilities

### ** Examples

## No test: 
# Needs MUSCLE installed - testing excluded

if(check.utility("muscle")) {

     ## Stucture of PKA:
     a <- read.pdb("1cmk")

     ## Stucture of PKB:
     b <- read.pdb("2jdo")

     ## Align and fit b on to a:
     path = file.path(tempdir(), "struct.aln")
     aln <- struct.aln(a, b, outpath = path, outfile = tempfile())
     
     ## Should be the same as aln$rmsd (when using aln$a.inds and aln$b.inds)
     rmsd(a$xyz, b$xyz, aln$a.inds$xyz, aln$b.inds$xyz, fit=TRUE)
     
     invisible( cat("\nSee the output files:", list.files(path, full.names = TRUE), sep="\n") )
}
## End(No test)

## Not run: 
##D      ## Align two subunits of GroEL (open and closed states)
##D      a <- read.pdb("1sx4")
##D      b <- read.pdb("1xck")
##D 
##D      ## Select chain A only
##D      a.inds <- atom.select(a, chain="A")
##D      b.inds <- atom.select(b, chain="A")
##D 
##D      ## Align and fit:
##D      aln <- struct.aln(a,b, a.inds, b.inds)
## End(Not run)



