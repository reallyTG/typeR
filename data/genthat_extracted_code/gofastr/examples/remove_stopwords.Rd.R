library(gofastr)


### Name: remove_stopwords
### Title: Remove Stopwords from a TermDocumentMatrix/DocumentTermMatrix
### Aliases: remove_stopwords prep_stopwords
### Keywords: stopwords

### ** Examples

(x <-with(presidential_debates_2012, q_dtm(dialogue, paste(time, tot, sep = "_"))))
remove_stopwords(x)
(y <- with(presidential_debates_2012, q_tdm(dialogue, paste(time, tot, sep = "_"))))
remove_stopwords(y)

prep_stopwords("the", "ChIcken", "Hello", tm::stopwords("english"), c("John", "Josh"))



