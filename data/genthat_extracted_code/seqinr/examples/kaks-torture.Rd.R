library(seqinr)


### Name: kaksTorture
### Title: Expected numeric results for Ka and Ks in extreme cases
### Aliases: kaksTorture
### Keywords: datasets

### ** Examples

data(kaksTorture)
kaks.torture <- read.alignment(file = system.file("sequences/kaks-torture.fasta", 
  package = "seqinr"), format = "fasta")
#
# Failed on windows :
#
# stopifnot(identical(kaksTorture, kaks(kaks.torture)))
# stopifnot(identical(kaksTorture, kaks(kaks.torture, rmgap = FALSE)))



