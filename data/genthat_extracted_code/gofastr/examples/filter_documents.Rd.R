library(gofastr)


### Name: filter_documents
### Title: Remove Documents Below a Threshold from a
###   TermDocumentMatrix/DocumentTermMatrix
### Aliases: filter_documents

### ** Examples

(x <-with(presidential_debates_2012, q_dtm(dialogue, paste(time, tot, sep = "_"))))
filter_documents(x)
(y <- with(presidential_debates_2012, q_tdm(dialogue, paste(time, tot, sep = "_"))))
filter_documents(y)



