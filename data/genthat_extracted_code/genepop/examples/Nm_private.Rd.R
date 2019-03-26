library(genepop)


### Name: Nm_private
### Title: Private allele method
### Aliases: Nm_private

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
Nm_private(locinfile,'sample.txt.PRI')



