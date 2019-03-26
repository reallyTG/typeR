library(polmineR)


### Name: corpus
### Title: Get corpus/corpora available or used.
### Aliases: corpus corpus,textstat-method corpus,kwic-method
###   corpus,character-method corpus,bundle-method corpus,missing-method

### ** Examples

use("polmineR")
corpus()

p <- partition("REUTERS", places = "kuwait")
corpus(p)

pb <- partition_bundle("REUTERS", s_attribute = "id")
corpus(pb)



