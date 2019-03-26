library(sentometrics)


### Name: sento_corpus
### Title: Create a sentocorpus object
### Aliases: sento_corpus

### ** Examples

data("usnews", package = "sentometrics")

# corpus construction
corp <- sento_corpus(corpusdf = usnews)

# take a random subset making use of quanteda
corpusSmall <- quanteda::corpus_sample(corp, size = 500)

# deleting a feature
quanteda::docvars(corp, field = "wapo") <- NULL

# deleting all features results in the addition of a dummy feature
quanteda::docvars(corp, field = c("economy", "noneconomy", "wsj")) <- NULL

## Not run: 
##D # to add or replace features, use the add_features() function...
##D quanteda::docvars(corp, field = c("wsj", "new")) <- 1
## End(Not run)

# corpus creation when no features are present
corpusDummy <- sento_corpus(corpusdf = usnews[, 1:3])




