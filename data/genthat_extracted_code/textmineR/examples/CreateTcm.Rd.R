library(textmineR)


### Name: CreateTcm
### Title: Convert a character vector to a term co-occurrence matrix.
### Aliases: CreateTcm

### ** Examples

## Not run: 
##D data(nih_sample)
##D 
##D # TCM of unigrams and bigrams
##D tcm <- CreateTcm(doc_vec = nih_sample$ABSTRACT_TEXT,
##D                  skipgram_window = Inf, 
##D                  ngram_window = c(1, 2))
##D 
##D # TCM of unigrams and a skip=gram window of 3, applying Porter's word stemmer
##D tcm <- CreateTcm(doc_vec = nih_sample$ABSTRACT_TEXT,
##D                  skipgram_window = 3,
##D                  stem_lemma_function = function(x) SnowballC::wordStem(x, "porter"))
## End(Not run)



