library(qdap)


### Name: freq_terms
### Title: Find Frequent Terms
### Aliases: freq_terms
### Keywords: frequent_terms

### ** Examples

## Not run: 
##D freq_terms(DATA$state, 5)
##D freq_terms(DATA$state)
##D freq_terms(DATA$state, extend = FALSE)
##D freq_terms(DATA$state, at.least = 4)
##D (out <- freq_terms(pres_debates2012$dialogue, stopwords = Top200Words))
##D plot(out)
##D 
##D ## All words by sentence (row)
##D library(qdapTools)
##D x <- raj$dialogue
##D list_df2df(setNames(lapply(x, freq_terms, top=Inf), seq_along(x)), "row")
##D list_df2df(setNames(lapply(x, freq_terms, top=10, stopwords = Dolch), 
##D     seq_along(x)), "Title")
##D 
##D 
##D ## All words by person
##D FUN <- function(x, n=Inf) freq_terms(paste(x, collapse=" "), top=n)
##D list_df2df(lapply(split(x, raj$person), FUN), "person")
##D 
##D ## Plot it
##D out <- lapply(split(x, raj$person), FUN, n=10)
##D pdf("Freq Terms by Person.pdf", width=13) 
##D lapply(seq_along(out), function(i) {
##D     ## dev.new()
##D     plot(out[[i]], plot=FALSE) + ggtitle(names(out)[i])
##D })
##D dev.off()
##D 
##D ## Keep spaces
##D freq_terms(space_fill(DATA$state, "are you"), 500, char.keep="~~")
## End(Not run)



