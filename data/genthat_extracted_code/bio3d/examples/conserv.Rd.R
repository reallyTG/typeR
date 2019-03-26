library(bio3d)


### Name: conserv
### Title: Score Residue Conservation At Each Position in an Alignment
### Aliases: conserv
### Keywords: utilities

### ** Examples

## Read an example alignment
aln <- read.fasta(system.file("examples/hivp_xray.fa",package="bio3d"))

## Score conservation
conserv(x=aln$ali, method="similarity", sub.matrix="bio3d")
##conserv(x=aln$ali,method="entropy22", sub.matrix="other")




