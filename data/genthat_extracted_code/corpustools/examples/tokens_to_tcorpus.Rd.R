library(corpustools)


### Name: tokens_to_tcorpus
### Title: Create a tcorpus based on tokens (i.e. preprocessed texts)
### Aliases: tokens_to_tcorpus

### ** Examples

head(corenlp_tokens)

tc = tokens_to_tcorpus(corenlp_tokens, doc_col = 'doc_id',
                       sentence_col = 'sentence', token_id_col = 'id')
tc

meta = data.frame(doc_id = 1, medium = 'A', date = '2010-01-01')
tc = tokens_to_tcorpus(corenlp_tokens, doc_col = 'doc_id',
                       sentence_col = 'sentence', token_id_col = 'id', meta=meta)
tc



