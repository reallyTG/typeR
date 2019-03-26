library(corpustools)


### Name: freq_filter
### Title: Support function for subset method
### Aliases: freq_filter

### ** Examples

tc = create_tcorpus(c('a a a b b'))

tc$get()
tc$subset(subset = freq_filter(token, min=3))
tc$get()



