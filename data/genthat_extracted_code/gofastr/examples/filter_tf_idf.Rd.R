library(gofastr)


### Name: filter_tf_idf
### Title: Remove Words Below a TF-IDF Threshold from a
###   TermDocumentMatrix/DocumentTermMatrix
### Aliases: filter_tf_idf

### ** Examples

(x <-with(presidential_debates_2012, q_dtm(dialogue, paste(person, time, sep = "_"))))
filter_tf_idf(x)
filter_tf_idf(x, .5)
filter_tf_idf(x, verbose=TRUE)
(y <- with(presidential_debates_2012, q_tdm(dialogue, paste(person, time, sep = "_"))))
filter_tf_idf(y)



