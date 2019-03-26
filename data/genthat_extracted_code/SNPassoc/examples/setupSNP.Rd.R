library(SNPassoc)


### Name: setupSNP
### Title: Convert columns in a dataframe to class 'snp'
### Aliases: setupSNP summary.setupSNP plot.setupSNP [.setupSNP
###   [[<-.setupSNP [<-.setupSNP $<-.setupSNP labels.setupSNP
### Keywords: utilities

### ** Examples


 data(SNPs)
 myDat<-setupSNP(SNPs,6:40,sep="")


#sorted SNPs and having genomic information
 data(SNPs.info.pos)
 myDat.o<-setupSNP(SNPs,6:40,sep="",sort=TRUE, info=SNPs.info.pos)

# summary
 summary(myDat.o)

# plot one SNP
  plot(myDat,which=2)




