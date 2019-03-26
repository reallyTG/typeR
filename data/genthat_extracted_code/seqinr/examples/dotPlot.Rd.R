library(seqinr)


### Name: dotPlot
### Title: Dot Plot Comparison of two sequences
### Aliases: dotPlot
### Keywords: utilities

### ** Examples

#
# Identity is on the main diagonal:
#
dotPlot(letters, letters, main = "Direct repeat")
#
# Internal repeats are off the main diagonal:
#
dotPlot(rep(letters, 2), rep(letters, 2), main = "Internal repeats")
#
# Inversions are orthogonal to the main diagonal:
#
dotPlot(letters, rev(letters), main = "Inversion")
#
# Insertion in the second sequence yields a vertical jump:
#
dotPlot(letters, c(letters[1:10], s2c("insertion"), letters[11:26]), 
  main = "Insertion in the second sequence", asp = 1)
#
# Insertion in the first sequence yields an horizontal jump:
#
dotPlot(c(letters[1:10], s2c("insertion"), letters[11:26]), letters,
  main = "Insertion in the first sequence", asp = 1)
#
# Protein sequences have usually a good signal/noise ratio because there
# are 20 possible amino-acids:
#
aafile <- system.file("sequences/seqAA.fasta", package = "seqinr")
protein <- read.fasta(aafile)[[1]]
dotPlot(protein, protein, main = "Dot plot of a protein\nwsize = 1, wstep = 1, nmatch = 1")
#
# Nucleic acid sequences have usually a poor signal/noise ratio because
# there are only 4 different bases:
#
dnafile <- system.file("sequences/malM.fasta", package = "seqinr")
dna <- protein <- read.fasta(dnafile)[[1]]
dotPlot(dna[1:200], dna[1:200],
 main = "Dot plot of a nucleic acid sequence\nwsize = 1, wstep = 1, nmatch = 1")
#
# Play with the wsize, wstep and nmatch arguments to increase the 
# signal/noise ratio:
#
dotPlot(dna[1:200], dna[1:200], wsize = 3, wstep = 3, nmatch = 3,
main = "Dot plot of a nucleic acid sequence\nwsize = 3, wstep = 3, nmatch = 3")



