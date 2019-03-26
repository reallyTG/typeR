library(stringi)


### Name: stri_count_boundaries
### Title: Count the Number of Text Boundaries
### Aliases: stri_count_boundaries stri_count_words

### ** Examples

test <- "The\u00a0above-mentioned    features are very useful. Kudos to their developers."
stri_count_boundaries(test, type="word")
stri_count_boundaries(test, type="sentence")
stri_count_boundaries(test, type="character")
stri_count_words(test)

test2 <- stri_trans_nfkd("\u03c0\u0153\u0119\u00a9\u00df\u2190\u2193\u2192")
stri_count_boundaries(test2, type="character")
stri_length(test2)
stri_numbytes(test2)




