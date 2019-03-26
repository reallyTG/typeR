library(corpustools)


### Name: tCorpus$code_features
### Title: Code features in a tCorpus based on a search string
### Aliases: tCorpus$code_features code_features

### ** Examples

tc = create_tcorpus('Anna and Bob are secretive')

tc$code_features(c("actors# anna bob", "associations# secretive"))
tc$get()



