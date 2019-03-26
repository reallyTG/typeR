library(corpustools)


### Name: tCorpus$top_features
### Title: Show top features
### Aliases: tCorpus$top_features top_features

### ** Examples

tc = tokens_to_tcorpus(corenlp_tokens, token_id_col = 'id')

tc$top_features('lemma')
tc$top_features('lemma', group_by = 'relation')



