library(microclass)


### Name: blastClassify16S
### Title: Classifying using BLAST
### Aliases: blastClassify16S

### ** Examples

data("small.16S")
seq <- small.16S$Sequence
tax <- sapply(strsplit(small.16S$Header,split=" "),function(x){x[2]})
## Not run: 
##D dbase <- blastDbase16S("test",seq,tax)
##D reads <- amplicon(seq)
##D predicted <- blastClassify16S(reads[nchar(reads)>0],dbase)
##D print(predicted)
## End(Not run)




