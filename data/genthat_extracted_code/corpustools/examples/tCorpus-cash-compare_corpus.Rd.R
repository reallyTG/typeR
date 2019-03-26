library(corpustools)


### Name: tCorpus$compare_corpus
### Title: Compare tCorpus vocabulary to that of another (reference)
###   tCorpus
### Aliases: tCorpus$compare_corpus compare_corpus

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')

tc$preprocess('token', 'feature', remove_stopwords = TRUE, use_stemming = TRUE)

obama = tc$subset_meta(president == 'Barack Obama', copy=TRUE)
bush = tc$subset_meta(president == 'George W. Bush', copy=TRUE)

comp = obama$compare_corpus(bush, 'feature')
comp = comp[order(-comp$chi),]
head(comp)
## Not run: 
##D plot(comp)
## End(Not run)



