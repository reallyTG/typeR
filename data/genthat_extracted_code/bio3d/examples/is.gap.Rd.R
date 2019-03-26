library(bio3d)


### Name: is.gap
### Title: Gap Characters
### Aliases: is.gap
### Keywords: utilities

### ** Examples


is.gap( c("G",".","X","-","G","K","S","T") )

## Not run: 
##D aln <- read.fasta( system.file("examples/kif1a.fa",
##D                    package = "bio3d") )
##D 
##D ##- Print only non-gap positions (i.e. no gaps in any sequence)
##D aln$ali[, !is.gap(aln) ]
##D 
##D ##- Mask any existing gaps with an "X"
##D xaln <- aln
##D xaln$ali[ is.gap(xaln$ali) ]="X"
##D 
##D ##- Read a new PDB and align its sequence to the existing masked alignment
##D pdb <- read.pdb( "1mkj" )
##D seq2aln(pdbseq(pdb), xaln, id = "1mkj")
## End(Not run)



