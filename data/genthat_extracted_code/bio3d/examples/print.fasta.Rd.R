library(bio3d)


### Name: print.fasta
### Title: Printing Sequence Alignments
### Aliases: print.fasta .print.fasta.ali
### Keywords: utilities

### ** Examples


     file <- system.file("examples/kif1a.fa",package="bio3d")
     aln  <- read.fasta(file)
     print(aln)

     # print(aln, col.inds=30:100, numbers=FALSE)



