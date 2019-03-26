library(qdap)


### Name: rm_stopwords
### Title: Remove Stop Words
### Aliases: rm_stopwords rm_stop %sw%
### Keywords: stopwords

### ** Examples

## Not run: 
##D rm_stopwords(DATA$state)
##D rm_stopwords(DATA$state, tm::stopwords("english"))
##D rm_stopwords(DATA$state, Top200Words)
##D rm_stopwords(DATA$state, Top200Words, strip = TRUE)
##D rm_stopwords(DATA$state, Top200Words, separate = FALSE)
##D rm_stopwords(DATA$state, Top200Words, separate = FALSE, ignore.case = FALSE)
##D rm_stopwords(DATA$state, Top200Words, unlist = TRUE)
##D rm_stopwords(DATA$state, Top200Words, unlist = TRUE, strip=TRUE)
##D rm_stop(DATA$state, Top200Words, unlist = TRUE, unique = TRUE)
##D 
##D c("I like it alot", "I like it too") %sw% qdapDictionaries::Top25Words
## End(Not run)



