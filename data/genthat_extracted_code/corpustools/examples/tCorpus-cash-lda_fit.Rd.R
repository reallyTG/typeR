library(corpustools)


### Name: tCorpus$lda_fit
### Title: Estimate a LDA topic model
### Aliases: tCorpus$lda_fit lda_fit

### ** Examples

## Not run: 
##D tc = create_tcorpus(sotu_texts, doc_column = 'id')
##D tc$preprocess('token', 'feature', remove_stopwords = TRUE, use_stemming = TRUE, min_freq=10)
##D set.seed(1)
##D m = tc$lda_fit('feature', create_feature = 'lda', K = 5, alpha = 0.1)
##D 
##D m
##D topicmodels::terms(m, 10)
##D tc$get()
## End(Not run)



