library(polmineR)


### Name: ngrams
### Title: Get N-Grams
### Aliases: ngrams ngrams,partition-method ngrams,character-method
###   ngrams,CorpusOrSubcorpus-method ngrams,partition_bundle-method

### ** Examples

use("polmineR")
P <- partition("GERMAPARLMINI", date = "2009-10-27")
ngramObject <- ngrams(P, n = 2, p_attribute = "word", char = NULL)

# a more complex scenario: get most frequent ADJA/NN-combinations
ngramObject <- ngrams(P, n = 2, p_attribute = c("word", "pos"), char = NULL)
ngramObject2 <- subset(
 ngramObject,
 ngramObject[["1_pos"]] == "ADJA"  & ngramObject[["2_pos"]] == "NN"
 )
ngramObject2@stat[, "1_pos" := NULL][, "2_pos" := NULL]
ngramObject3 <- sort(ngramObject2, by = "count")
head(ngramObject3)



