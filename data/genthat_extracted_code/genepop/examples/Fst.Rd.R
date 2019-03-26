library(genepop)


### Name: Fst
### Title: Fst (or rho_ST) estimation
### Aliases: Fst

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
Fst(locinfile, outputFile= 'sample.txt.DIV')



