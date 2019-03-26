library(corpustools)


### Name: tCorpus$compare_subset
### Title: Compare vocabulary of a subset of a tCorpus to the rest of the
###   tCorpus
### Aliases: tCorpus$compare_subset compare_subset

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')

tc$preprocess('token', 'feature', remove_stopwords = TRUE, use_stemming = TRUE)

comp = tc$compare_subset('feature', subset_meta_x = president == 'Barack Obama')
comp = comp[order(-comp$chi),]
head(comp)
## Not run: 
##D plot(comp)
## End(Not run)

comp = tc$compare_subset('feature', query_x = 'terroris*')
comp = comp[order(-comp$chi),]
head(comp, 10)



