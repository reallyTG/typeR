library(bio3d)


### Name: seqaln
### Title: Sequence Alignment with MUSCLE
### Aliases: seqaln
### Keywords: utilities

### ** Examples

## Not run: 
##D ##-- Basic sequence alignemnt
##D seqs <- get.seq(c("4q21_A", "1ftn_A"))
##D aln <- seqaln(seqs)
##D 
##D ##-- add a sequence to the (profile) alignment
##D seq <- get.seq("1tnd_A")
##D aln <- seqaln(seq, profile=aln)
##D 
##D 
##D ##-- Read a folder/directory of PDB files
##D #pdb.path <- "my_dir_of_pdbs"
##D #files  <- list.files(path=pdb.path ,
##D #                     pattern=".pdb",
##D #                     full.names=TRUE)
##D 
##D ##-- Use online files
##D files <- get.pdb(c("4q21","1ftn"), URLonly=TRUE)
##D 
##D ##-- Extract and store sequences
##D raw <- NULL
##D for(i in 1:length(files)) {
##D   pdb <- read.pdb(files[i])
##D   raw <- seqbind(raw, pdbseq(pdb) )
##D }
##D 
##D ##-- Align these sequences
##D aln <- seqaln(raw, id=files, outfile="seqaln.fa")
##D 
##D ##-- Read Aligned PDBs storing coordinate data
##D pdbs <- read.fasta.pdb(aln) 
##D 
##D ## Sequence identity
##D seqidentity(aln)
##D 
##D ## Note that all the above can be done with the pdbaln() function:
##D #pdbs <- pdbaln(files)
##D 
##D 
##D ##-- For identical sequences with masking use a custom matrix
##D aa <- seqbind(c("X","C","X","X","A","G","K"),
##D               c("C","-","A","X","G","X","X","K"))
##D 
##D aln <- seqaln(aln=aln, id=c("a","b"), outfile="temp.fas", protein=TRUE,
##D                extra.args= paste("-matrix",
##D                 system.file("matrices/custom.mat", package="bio3d"),
##D                 "-gapopen -3.0 ",
##D                 "-gapextend -0.5",
##D                 "-center 0.0") )
## End(Not run)



