library(stringi)


### Name: stri_locate_all_boundaries
### Title: Locate Text Boundaries
### Aliases: stri_locate_all_boundaries stri_locate_last_boundaries
###   stri_locate_first_boundaries stri_locate_all_words
###   stri_locate_last_words stri_locate_first_words

### ** Examples

test <- "The\u00a0above-mentioned    features are very useful. Kudos to their developers."
stri_locate_all_boundaries(test, type="line")
stri_locate_all_boundaries(test, type="word")
stri_locate_all_boundaries(test, type="sentence")
stri_locate_all_boundaries(test, type="character")
stri_locate_all_words(test)

stri_extract_all_boundaries("Mr. Jones and Mrs. Brown are very happy.
So am I, Prof. Smith.", type="sentence", locale="en_US@ss=standard") # ICU >= 56 only




