library(bios2mds)


### Name: dif
### Title: Difference score
### Aliases: dif
### Keywords: distance

### ** Examples

# calculating the difference score between the sequences 
# of CLTR1_HUMAN and CLTR2_HUMAN:
aln <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
dif <- dif(aln$CLTR1_HUMAN, aln$CLTR2_HUMAN)
dif



