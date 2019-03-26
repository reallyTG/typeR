library(quanteda)


### Name: as.dictionary
### Title: Coercion and checking functions for dictionary objects
### Aliases: as.dictionary is.dictionary

### ** Examples

## Not run: 
##D data(sentiments, package = "tidytext")
##D as.dictionary(subset(sentiments, lexicon == "nrc"))
##D as.dictionary(subset(sentiments, lexicon == "bing"))
##D # to convert AFINN into polarities - adjust thresholds if desired
##D afinn <- subset(sentiments, lexicon == "AFINN")
##D afinn[["sentiment"]] <-
##D     with(afinn,
##D          sentiment <- ifelse(score < 0, "negative",
##D                              ifelse(score > 0, "positive", "netural"))
##D     )
##D with(afinn, table(score, sentiment))
##D as.dictionary(afinn)
## End(Not run)

is.dictionary(dictionary(list(key1 = c("val1", "val2"), key2 = "val3")))
## [1] TRUE
is.dictionary(list(key1 = c("val1", "val2"), key2 = "val3"))
## [1] FALSE



