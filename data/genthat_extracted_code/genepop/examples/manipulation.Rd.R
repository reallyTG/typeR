library(genepop)


### Name: diploidize
### Title: Various data manipulation utilities
### Aliases: diploidize manipulation relabel_alleles manipulation
###   pop_to_indiv sample_haploid

### ** Examples

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- diploidize(inputFile = locinfile,outputFile="Dsample.txt")



