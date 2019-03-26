library(microclass)


### Name: rdpClassify
### Title: Classifying with the RDP classifier
### Aliases: rdpClassify

### ** Examples

data("small.16S")
seq <- small.16S$Sequence
tax <- sapply(strsplit(small.16S$Header,split=" "),function(x){x[2]})
## Not run: 
##D trn <- rdpTrain(seq,tax)
##D primer.515f <- "GTGYCAGCMGCCGCGGTAA"
##D primer.806rB <- "GGACTACNVGGGTWTCTAAT"
##D reads <- amplicon(seq, primer.515f, primer.806rB)
##D predicted <- rdpClassify(unlist(reads[nchar(reads)>0]),trn)
##D print(predicted)
## End(Not run)




