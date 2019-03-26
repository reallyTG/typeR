library(corpustools)


### Name: tCorpus$kwic
### Title: Get keyword-in-context (KWIC) strings
### Aliases: tCorpus$kwic kwic

### ** Examples

tc = tokens_to_tcorpus(corenlp_tokens, sentence_col = 'sentence', token_id_col = 'id')

## look directly for a term (or complex query)
tc$kwic(query = 'love*')

## or, first perform a feature search, and then get the KWIC for the results
hits = tc$search_features('(john OR mark) AND mary AND love*', context_level = 'sentence')
tc$kwic(hits, context_level = 'sentence')



