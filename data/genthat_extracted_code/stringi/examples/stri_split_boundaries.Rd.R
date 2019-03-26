library(stringi)


### Name: stri_split_boundaries
### Title: Split a String at Text Boundaries
### Aliases: stri_split_boundaries

### ** Examples

test <- "The\u00a0above-mentioned    features are very useful. " %s+%
   "Kudos to their developers. 123 456 789"
stri_split_boundaries(test, type="line")
stri_split_boundaries(test, type="word")
stri_split_boundaries(test, type="word", skip_word_none=TRUE)
stri_split_boundaries(test, type="word", skip_word_none=TRUE, skip_word_letter=TRUE)
stri_split_boundaries(test, type="word", skip_word_none=TRUE, skip_word_number=TRUE)
stri_split_boundaries(test, type="sentence")
stri_split_boundaries(test, type="sentence", skip_sentence_sep=TRUE)
stri_split_boundaries(test, type="character")

# a filtered break iterator with the new ICU:
stri_split_boundaries("Mr. Jones and Mrs. Brown are very happy.
So am I, Prof. Smith.", type="sentence", locale="en_US@ss=standard") # ICU >= 56 only




