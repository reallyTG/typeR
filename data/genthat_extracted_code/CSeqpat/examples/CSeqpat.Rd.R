library(CSeqpat)


### Name: CSeqpat
### Title: Mining Frequent Contiguous Sequential Patterns in a Text Corpus
### Aliases: CSeqpat

### ** Examples

test1 <- c("hoagie institution food year road ",
"place little dated opened weekend fresh food")
tf <- tempfile()
writeLines(test1, tf)
CSeqpat(tf,1,2,2,"\t",TRUE,FALSE,TRUE,FALSE)



