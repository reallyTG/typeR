library(seqinr)


### Name: cai
### Title: Codon Adaptation Index
### Aliases: cai

### ** Examples

#
# How to reproduce the results obtained with the C program codonW
# version 1.4.4 writen by John Peden. We use here the "input.dat"
# test file from codonW (Saccharomyces cerevisiae).
#
  inputdatfile <- system.file("sequences/input.dat", package = "seqinr")
  input <- read.fasta(file = inputdatfile) # read the FASTA file
#
# Import results obtained with codonW
#
  scucofile <- system.file("sequences/scuco.txt", package = "seqinr")
  scuco.res <- read.table(scucofile, header = TRUE) # read codonW result file
#
# Use w for Saccharomyces cerevisiae
#
  data(caitab)
  w <- caitab$sc
#
# Compute CAI and compare results:
#
  cai.res <- sapply(input, cai, w = w)
  plot(cai.res, scuco.res$CAI,
    main = "Comparison of seqinR and codonW results",
    xlab = "CAI from seqinR",
    ylab = "CAI from codonW",
    las = 1)
  abline(c(0,1))



