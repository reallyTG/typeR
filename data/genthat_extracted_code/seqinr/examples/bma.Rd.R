library(seqinr)


### Name: bma
### Title: Computing an IUPAC nucleotide symbol
### Aliases: bma

### ** Examples


stopifnot(bma(s2c("atatattttata")) == "w")
stopifnot(bma(s2c("gcggcgcgcggc")) == "s")
stopifnot(bma(s2c("ACGT")) == "n")
stopifnot(is.na(bma(s2c("atatttt---tatat")))) # a warning is issued



