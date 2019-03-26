library(stepwise)


### Name: stepwise.seqs
### Title: Simulated sequence alignment from the stepwise package
### Aliases: stepwise.seqs stepwise
### Keywords: datasets

### ** Examples
 
data(stepwise.seqs) 
dim(stepwise.seqs) # 30 x 1000
## Not run: 
##D # write the 30 sequences to a Phylip-format input file 
##D cat(paste(nrow(stepwise.seqs),ncol(stepwise.seqs),"\n"),
##D file="stepwise.phy")
##D write.table(stepwise.seqs,file="stepwise.phy",append=TRUE,quote=FALSE,
##D sep="", row.names=TRUE,col.names=FALSE)
## End(Not run)



