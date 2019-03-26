library(genepop)


### Name: genedivFis
### Title: Gene diversities and Fis (or rho_IS)
### Aliases: genedivFis

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
genedivFis(locinfile,outputFile = 'sample.txt.DIV')



