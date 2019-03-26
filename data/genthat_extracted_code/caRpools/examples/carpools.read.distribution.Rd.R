library(caRpools)


### Name: carpools.read.distribution
### Title: QC: Plot Readcount Distribution
### Aliases: carpools.read.distribution
### Keywords: ~Distribution ~Reads

### ** Examples

data(caRpools)

carpools.read.distribution(CONTROL1, fullmatchcolumn=2,breaks=200,
  title=d.CONTROL1, xlab="log2 Readcount", ylab="# sgRNAs",statistics=TRUE) 
  
carpools.read.distribution(CONTROL1, fullmatchcolumn=2,breaks=200,
  title=d.CONTROL1, xlab="log2 Readcount", ylab="# sgRNAs",statistics=TRUE,
  type="whisker") 




