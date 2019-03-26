library(corpustools)


### Name: tCorpus$context
### Title: Get a context vector
### Aliases: tCorpus$context context

### ** Examples

tc <- create_tcorpus(c('Text one first sentence. Text one second sentence', 'Text two'),
                     split_sentences = TRUE)

doc <- tc$context() ## default context is doc_id (document level)
doc

sent <- tc$context('sentence') ## can specify sentence level
sent



