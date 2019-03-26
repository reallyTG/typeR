library(bios2mds)


### Name: mat.dif
### Title: Matrices of difference scores between sequences
### Aliases: mat.dif
### Keywords: distance

### ** Examples

# calculating the matrix of distances based on the difference scores
# between GPCRs sample from H. sapiens and D. melanogaster:
aln_human <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
aln_drome <- import.fasta(system.file("msa/drome_gpcr.fa", package = "bios2mds"))
mat.dif1 <- mat.dif(aln_human[1:5], aln_drome[1:5])
mat.dif1



