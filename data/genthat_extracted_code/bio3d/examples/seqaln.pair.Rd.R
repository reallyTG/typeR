library(bio3d)


### Name: seqaln.pair
### Title: Sequence Alignment of Identical Protein Sequences
### Aliases: seqaln.pair
### Keywords: utilities

### ** Examples


## NOTE: FOLLOWING EXAMPLE NEEDS MUSCLE INSTALLED
if(check.utility("muscle")) {

##- Aligning a PDB sequence to an existing sequence alignment


##- Simple example
aln <- seqbind(c("X","C","X","X","A","G","K"),
               c("C","-","A","X","G","X","X","K"))

seqaln.pair(aln, outfile = tempfile())

}



