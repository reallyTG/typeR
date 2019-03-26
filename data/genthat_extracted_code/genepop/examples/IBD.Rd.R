library(genepop)


### Name: IBD
### Title: Isolation by distance
### Aliases: IBD ibd

### ** Examples

## Not run: 
##D infile <- system.file('extdata', 'w2.txt',package='genepop')
##D locinfile <- 'w2.txt'
##D check <- file.copy(infile,locinfile,overwrite=TRUE)
##D outfile <- ibd(locinfile,'w2.txt.ISO', geographicScale = 'Log', statistic='e')
##D 
##D infile <- system.file('extdata', 'PEL1600withCoord.txt',package='genepop')
##D locinfile <- 'PEL1600withCoord.txt'
##D check <- file.copy(infile,locinfile,overwrite=TRUE)
##D outfile <- ibd(locinfile,'PEL1600withCoord.ISO', statistic = 'SingleGeneDiv',
##D                geographicScale = '1D')
## End(Not run)



