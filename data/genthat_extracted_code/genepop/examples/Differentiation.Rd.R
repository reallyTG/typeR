library(genepop)


### Name: Differentiation
### Title: Tests of genic and genotypic differentiation
### Aliases: Differentiation test_diff

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
test_diff(locinfile,outputFile='sample.txt.GE')



