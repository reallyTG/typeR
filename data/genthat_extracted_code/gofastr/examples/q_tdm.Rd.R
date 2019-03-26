library(gofastr)


### Name: q_tdm
### Title: Quick TermDocumentMatrix
### Aliases: q_tdm q_tdm_stem
### Keywords: TermDocumentMatrix tdm

### ** Examples

(x <- with(presidential_debates_2012, q_tdm(dialogue, paste(time, tot, sep = "_"))))
tm::weightTfIdf(x)

(x2 <- with(presidential_debates_2012, q_tdm_stem(dialogue, paste(time, tot, sep = "_"))))
remove_stopwords(x2, stem=TRUE)



