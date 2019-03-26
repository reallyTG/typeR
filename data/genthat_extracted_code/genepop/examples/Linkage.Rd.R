library(genepop)


### Name: Linkage
### Title: Tables and exact test for genotypic linkage disequilibrium
### Aliases: Linkage test_LD write_LD_tables

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
test_LD(locinfile,'sample.txt.DIS')
infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt' ## file in user's directory not in R's extdata directory
check <- file.copy(infile,locinfile,overwrite=TRUE)
write_LD_tables(locinfile,'sample.txt.TAB')



