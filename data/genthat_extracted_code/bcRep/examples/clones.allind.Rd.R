library(bcRep)


### Name: clones.allind
### Title: B cell clones of 8 individuals
### Aliases: clones.allind
### Keywords: datasets

### ** Examples

data(clones.allind)
str(clones.allind)
boxplot(clones.allind$CDR3_length_AA ~ clones.allind$samples,xlab="sample",
     ylab="CDR3 length [AA]",xaxt="n",main="CDR3 length distribution of clones", las=3)
axis(1,at=seq(1,length(unique(clones.allind$samples)),1),
     unique(clones.allind$samples))



