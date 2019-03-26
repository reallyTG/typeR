library(Bios2cor)


### Name: random.msa
### Title: Random Alignment
### Aliases: random.msa
### Keywords: utilities

### ** Examples

# generating a random sequence alignment with the same characterics
# as human GPCRs:
aln <- import.fasta(system.file("msa/toy2_align.fa", package = "Bios2cor"))
nb.seq <- length(aln)
nb.pos <- length(aln[[1]])
aln.random <- random.msa(nb.seq = nb.seq, nb.pos = nb.pos)



