library(gtWAS)


### Name: gtWAS
### Title: Genome and Transcriptome Wide Association Study
### Aliases: gtWAS
### Keywords: gtWAS

### ** Examples

data(Tdata)
data(alldata)
independent <- "E(B)"
gtWAS(Tdata,alldata,independent,selection='stepwise',select="SBC",
      Choose="SBC",vecThr=c(0.05,0.05,0.05),correct = "Bonferroni")



