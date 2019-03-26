library(corpustools)


### Name: tCorpus$feature_subset
### Title: Filter features
### Aliases: tCorpus$feature_subset feature_subset

### ** Examples

tc = create_tcorpus('a a a a b b b c c')

tc$feature_subset('token', 'tokens_subset1', subset = token_id < 5)
tc$feature_subset('token', 'tokens_subset2', subset = freq_filter(token, min = 3))

tc$get()



