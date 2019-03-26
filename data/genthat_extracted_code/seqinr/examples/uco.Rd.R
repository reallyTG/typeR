library(seqinr)


### Name: uco
### Title: Codon usage indices
### Aliases: uco rscu
### Keywords: manip

### ** Examples


## Show all possible codons:
words()

## Make a coding sequence from this:
(cds <- s2c(paste(words(), collapse = "")))

## Get codon counts:
uco(cds, index = "eff")

## Get codon relative frequencies:
uco(cds, index = "freq")

## Get RSCU values:
uco(cds, index = "rscu")

## Show what happens with ambiguous bases:
uco(s2c("aaannnttt"))

## Use a real coding sequence:
rcds <- read.fasta(file = system.file("sequences/malM.fasta", package = "seqinr"))[[1]]
uco( rcds, index = "freq")
uco( rcds, index = "eff")
uco( rcds, index = "rscu")
uco( rcds, as.data.frame = TRUE)

## Show what happens with RSCU when an amino-acid is missing:
ecolicgpe5 <- read.fasta(file = system.file("sequences/ecolicgpe5.fasta",package="seqinr"))[[1]]
uco(ecolicgpe5, index = "rscu")

## Force NA to zero:
uco(ecolicgpe5, index = "rscu", NA.rscu = 0)



