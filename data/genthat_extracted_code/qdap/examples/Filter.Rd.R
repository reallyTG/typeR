library(qdap)


### Name: Filter.all_words
### Title: Filter
### Aliases: Filter.all_words Filter.TermDocumentMatrix
###   Filter.DocumentTermMatrix Filter Filter.wfm Filter.character
###   Filter.fwl Filter.fswl Filter.rfswl

### ** Examples

## Not run: 
##D Filter(with(DATA, wfm(state, list(sex, adult))), 5)
##D with(DATA, wfm(state, list(sex, adult)))
##D 
##D ## Filter particular words based on max/min values in wfm
##D v <- with(DATA, wfm(state, list(sex, adult)))
##D Filter(v, 5)
##D Filter(v, 5, count.apostrophe = FALSE)
##D Filter(v, 5, 7)
##D Filter(v, 4, 4)
##D Filter(v, 3, 4)
##D Filter(v, 3, 4, stopwords = Top25Words)
##D 
##D ## Filter works on character strings too...
##D x <- c("Raptors don't like robots!",  "I'd pay $500.00 to rid them.")
##D Filter(x, 3)
##D Filter(x, 4)
##D Filter(x, 4, count.apostrophe = FALSE)
##D Filter(x, 4, count.apostrophe = FALSE, stopwords="raptors")
##D Filter(x, 4, stopwords="raptors")
##D Filter(x, 4, stopwords="raptors", ignore.case = FALSE)
##D 
##D DATA[, "state"] <- Filter(DATA[, "state"], 4)
##D DATA <- qdap::DATA
##D 
##D ## Filter `all_words`
##D head(all_words(raj$dialogue))
##D Filter(head(all_words(raj$dialogue)), min = 3)
## End(Not run)



