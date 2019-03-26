library(corpustools)


### Name: tCorpus$dtm
### Title: Create a document term matrix.
### Aliases: tCorpus$dtm dtm dfm tCorpus$dfm

### ** Examples

tc = create_tcorpus(c("First text first sentence. First text first sentence.",
                   "Second text first sentence"), doc_column = 'id', split_sentences = TRUE)

## Perform additional preprocessing on the 'token' column, and save as the 'feature' column
tc$preprocess('token', 'feature', remove_stopwords = TRUE, use_stemming = TRUE)
tc$get()

## default: regular sparse matrix, using the Matrix package
m = tc$dtm('feature')
class(m)
m

## alternatively, create quanteda ('quanteda_dfm') or tm ('tm_dtm') class for DTM
## Not run: 
##D m = tc$dtm('feature', form = 'quanteda_dfm')
##D class(m)
##D m
## End(Not run)

## create DTM with sentences as rows (instead of documents)
m = tc$dtm('feature', context_level = 'sentence')
nrow(m)

## use weighting
m = tc$dtm('feature', weight = 'norm_tfidf')



