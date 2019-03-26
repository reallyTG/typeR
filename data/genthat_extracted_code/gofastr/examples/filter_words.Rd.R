library(gofastr)


### Name: filter_words
### Title: Remove Words Below a Threshold from a
###   TermDocumentMatrix/DocumentTermMatrix
### Aliases: filter_words

### ** Examples

(x <-with(presidential_debates_2012, q_dtm(dialogue, paste(time, tot, sep = "_"))))
filter_words(x)
filter_words(x, 5)
(y <- with(presidential_debates_2012, q_tdm(dialogue, paste(time, tot, sep = "_"))))
filter_words(y, 6)



