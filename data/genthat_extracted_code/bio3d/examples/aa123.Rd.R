library(bio3d)


### Name: aa123
### Title: Convert Between 1-letter and 3-letter Aminoacid Codes
### Aliases: aa123 aa321
### Keywords: utilities

### ** Examples

# Simple conversion
aa123(c("D","L","A","G","S","H"))
aa321(c("ASP", "LEU", "ALA", "GLY", "SER", "HIS"))

## Not run: 
##D # Extract sequence from a PDB file's ATOM and SEQRES cards
##D pdb <- read.pdb("1BG2") 
##D s <- aa321(pdb$seqres)                   # SEQRES
##D a <- aa321(pdb$atom[pdb$calpha,"resid"]) # ATOM
##D 
##D # Write both sequences to a fasta file
##D write.fasta(alignment=seqbind(s,a), id=c("seqres","atom"), file="eg2.fa")
##D 
##D # Alternative approach for ATOM sequence extraction
##D pdbseq(pdb)
##D pdbseq(pdb, aa1=FALSE )
## End(Not run)



