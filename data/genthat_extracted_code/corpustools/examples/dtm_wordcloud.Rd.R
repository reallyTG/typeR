library(corpustools)


### Name: dtm_wordcloud
### Title: Plot a word cloud from a dtm
### Aliases: dtm_wordcloud

### ** Examples

## create DTM
tc = create_tcorpus(sotu_texts[1:100,], doc_column = 'id')
tc$preprocess('token', 'feature', remove_stopwords = TRUE)
dtm = tc$dtm('feature')

## Not run: 
##D dtm_wordcloud(dtm, nterms = 20)
##D 
##D ## or without a DTM
##D dtm_wordcloud(terms = c('in','the','cloud'), freqs = c(2,5,10))
## End(Not run)



