library(corpustools)


### Name: docfreq_filter
### Title: Support function for subset method
### Aliases: docfreq_filter

### ** Examples

tc = create_tcorpus(c('a a a b b', 'a a c c'))

tc$get()
tc$subset(subset = docfreq_filter(token, min=2))
tc$get()



