library(compareGroups)


### Name: compareSNPs
### Title: Summarise genetic data by groups.
### Aliases: compareSNPs print.compareSNPs
### Keywords: misc

### ** Examples


require(compareGroups) 


# load example data (taken from SNPassoc)
data(SNPs)

# visualize first rows
head(SNPs)

# select casco and all SNPs
myDat <- SNPs[,c(2,6:40)]

# QC of three SNPs by groups of cases and controls
res<-compareSNPs(casco ~ .-casco, myDat)
res

# QC of three SNPs of the whole data set
res<-compareSNPs( ~ .-casco, myDat)
res




