library(gofastr)


### Name: q_dtm
### Title: Quick DocumentTermMatrix
### Aliases: q_dtm q_dtm_stem
### Keywords: DocumentTermMatrix dtm

### ** Examples

(x <- with(presidential_debates_2012, q_dtm(dialogue, paste(time, tot, sep = "_"))))
tm::weightTfIdf(x)

(x2 <- with(presidential_debates_2012, q_dtm_stem(dialogue, paste(time, tot, sep = "_"))))
remove_stopwords(x2, stem=TRUE)

bigrams <- c('make sure', 'governor romney', 'mister president',
    'united states', 'middle class', 'middle east', 'health care',
    'american people', 'dodd frank', 'wall street', 'small business')

grep(" ", x$dimnames$Terms, value = TRUE) #no ngrams

(x3 <- with(presidential_debates_2012,
    q_dtm(dialogue, paste(time, tot, sep = "_"), ngrams = bigrams)
))

grep(" ", x3$dimnames$Terms, value = TRUE) #ngrams



