library(corpustools)


### Name: tCorpus$feature_stats
### Title: Feature statistics
### Aliases: tCorpus$feature_stats feature_stats

### ** Examples

tc = create_tcorpus(c('Text one first sentence. Text one second sentence', 'Text two'),
                    split_sentences = TRUE)

fs = tc$feature_stats('token')
head(fs)

fs = tc$feature_stats('token', context_level = 'sentence')
head(fs)



