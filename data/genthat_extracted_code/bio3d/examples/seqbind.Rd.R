library(bio3d)


### Name: seqbind
### Title: Combine Sequences by Rows Without Recycling
### Aliases: seqbind
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Read two pdbs
##D a.pdb <- read.pdb("1bg2")
##D b.pdb <- read.pdb("1goj")
##D 
##D seqs <- seqbind(aa321(a.pdb$atom[a.pdb$calpha,"resid"]),
##D                 aa321(b.pdb$atom[b.pdb$calpha,"resid"]))
##D 
##D # seqaln(seqs)
## End(Not run)



