library(TmCalculator)


### Name: Tm_NN
### Title: Calculate melting temperature using nearest neighbor
###   thermodynamics
### Aliases: Tm_NN

### ** Examples

ntseq <- c("AAAATTTTTTTCCCCCCCCCCCCCCGGGGGGGGGGGGTGTGCGCTGC")
Tm_NN(ntseq, ambiguous = FALSE, comSeq = NULL, shift = 0, nn_table = "DNA_NN4",
tmm_table = "DNA_TMM1", imm_table = "DNA_IMM1",de_table = "DNA_DE1", dnac1 = 25,
dnac2 = 25, selfcomp = FALSE, Na = 50, K = 0, Tris = 0, Mg = 0, dNTPs = 0, saltcorr = 5)



