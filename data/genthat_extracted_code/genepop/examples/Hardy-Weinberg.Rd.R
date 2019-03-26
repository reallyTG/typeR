library(genepop)


### Name: Hardy-Weinberg
### Title: Tests of Hardy-Weinberg genotypic proportions
### Aliases: Hardy-Weinberg test_HW HWtable_analysis

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
test_HW(locinfile, which='deficit', 'sample.txt.D')
# Example in Guo & Thompson 1992 Table 5
infile <- system.file('extdata', 'Rhesus.txt',package='genepop')
locinfile <- 'Rhesus.txt'
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- HWtable_analysis(locinfile,which='Proba',batches = 1000,iterations = 1000)
readLines(outfile)[21]



