library(corpustools)


### Name: print.contextHits
### Title: S3 print for contextHits class
### Aliases: print.contextHits

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)
hits = tc$search_contexts(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'))

hits



