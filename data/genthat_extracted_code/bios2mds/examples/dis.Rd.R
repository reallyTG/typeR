library(bios2mds)


### Name: dis
### Title: Dissimilarity score
### Aliases: dis
### Keywords: distance

### ** Examples

# calculating dis between the sequences of CLTR1_HUMAN and CLTR2_HUMAN:
aln <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
dis <- dis(aln$CLTR1_HUMAN, aln$CLTR2_HUMAN)
dis



