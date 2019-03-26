library(textmineR)


### Name: CreateDtm
### Title: Convert a character vector to a document term matrix.
### Aliases: CreateDtm

### ** Examples

## Not run: 
##D data(nih_sample)
##D 
##D # DTM of unigrams and bigrams
##D dtm <- CreateDtm(doc_vec = nih_sample$ABSTRACT_TEXT,
##D                  doc_names = nih_sample$APPLICATION_ID, 
##D                  ngram_window = c(1, 2))
##D 
##D # DTM of unigrams with Porter's stemmer applied
##D dtm <- CreateDtm(doc_vec = nih_sample$ABSTRACT_TEXT,
##D                  doc_names = nih_sample$APPLICATION_ID,
##D                  stem_lemma_function = function(x) SnowballC::wordStem(x, "porter"))
## End(Not run)



