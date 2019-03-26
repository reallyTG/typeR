library(corpustools)


### Name: summary.featureHits
### Title: S3 summary for featureHits class
### Aliases: summary.featureHits

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)
hits = tc$search_features(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'))

summary(hits)



