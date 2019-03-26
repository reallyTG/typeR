library(bios2mds)


### Name: mat.dis
### Title: Matrices of dissimilarity scores between amino acid sequences
### Aliases: mat.dis
### Keywords: distance

### ** Examples

# calculating dissimilarity distances between GPCR sequences sample from 
#H. sapiens and D. melanogaster, based on the PAM250 matrix:
aln_human <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
aln_drome <- import.fasta(system.file("msa/drome_gpcr.fa", package = "bios2mds"))
mat.dis1 <- mat.dis(aln_human[1:5], aln_drome[1:5])
mat.dis1

# calculating dissimilarity distances between GPCRs sequences sample from 
#H. sapiens and D. melanogaster, based on the BLOSUM45 matrix:
aln_human <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
aln_drome <- import.fasta(system.file("msa/drome_gpcr.fa", package = "bios2mds"))
mat.dis1 <- mat.dis(aln_human[1:5], aln_drome[1:5], sub.mat.id = "BLOSUM45")
mat.dis1



