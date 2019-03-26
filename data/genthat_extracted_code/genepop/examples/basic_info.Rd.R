library(genepop)


### Name: basic_info
### Title: Allele and genotype frequencies
### Aliases: basic_info

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
basic_info(locinfile,'sample.txt.INF')



