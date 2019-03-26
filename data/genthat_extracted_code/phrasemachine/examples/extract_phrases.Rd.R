library(phrasemachine)


### Name: extract_phrases
### Title: Extract Phrases
### Aliases: extract_phrases

### ** Examples

## Not run: 
##D # make sure quanteda is installed
##D requireNamespace("quanteda", quietly = TRUE)
##D # load in U.S. presidential inaugural speeches from Quanteda example data.
##D documents <- quanteda::data_corpus_inaugural
##D # use first 10 documents for example
##D documents <- documents[1:10,]
##D 
##D # run tagger
##D tagged_documents <- POS_tag_documents(documents)
##D 
##D phrases <- extract_phrases(tagged_documents,
##D                            regex = "(A|N)*N(PD*(A|N)*N)*",
##D                            maximum_ngram_length = 8,
##D                            minimum_ngram_length = 1)
## End(Not run)



