library(rphast)


### Name: read.hmm
### Title: Read an HMM object from a file
### Aliases: read.hmm
### Keywords: hmm

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
file <- "coding.hmm"
unzip(exampleArchive, file)
# this is a 5-state hmm with states representing
# intergenic, intron, first, second, and third codon positions.
h <- read.hmm(file)
h
unlink(file)



