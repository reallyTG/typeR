library(corpustools)


### Name: tCorpus$feature_associations
### Title: Get common nearby terms given a feature query
### Aliases: tCorpus$feature_associations feature_associations

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')

## directly from query
topf = tc$feature_associations('war')
head(topf, 20) ## frequent words close to "war"

## adjust window size
topf = tc$feature_associations('war', window = 5)
head(topf, 20) ## frequent words very close (five tokens) to "war"

## you can also first perform search_features, to get hits for (complex) queries
hits = tc$search_features('"war terror"~10')
topf = tc$feature_associations(hits = hits)
head(topf, 20) ## frequent words close to the combination of "war" and "terror" within 10 words




