library(FBN)


### Name: FBNormalization
### Title: FISH Based Normalization and Copy Number inference of SNP
###   microarray data
### Aliases: FBNormalization

### ** Examples


## set path to FBN package data directory
rawDataFileName = './../data/hmcls.txt'
fishProbesFileName = './../data/FISHprobes.txt'
normDataFileName= 'hmcls_NORM.txt'
FBNormalization(rawDataFileName, fishProbesFileName, normDataFileName, 
	debugFlag = FALSE)



