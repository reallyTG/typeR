library(koRpus)


### Name: query
### Title: A method to get information out of koRpus objects
### Aliases: query query,kRp.corp.freq-method query,kRp.tagged-method
### Keywords: methods

### ** Examples

## Not run: 
##D # look up frequencies for the word "aber"
##D query(LCC.data, var="word", query="aber")
##D 
##D # show all entries with a frequency of exactly 3000 in the corpus
##D query(LCC.data, "freq", 3000)
##D 
##D # now, which words appear more than 40000 times in a million?
##D query(LCC.data, "pmio", 40000, "gt")
##D 
##D # example for a range request: words with a log10 between 2 and 2.1
##D # (including these two values)
##D query(LCC.data, "log10", c(2, 2.1))
##D # (and without them)
##D query(LCC.data, "log10", c(2, 2.1), "gt")
##D 
##D # example for a list of queries: get words with a frequency between
##D # 700 and 750 per million and at least five letters
##D query(LCC.data, query=list(
##D   list(pmio=c(700,750)),
##D   list(lttr=5, rel="ge"))
##D )
##D 
##D # get all "he" lemmata in a previously tagged text object
##D query(tagged.txt, "lemma", "he")
## End(Not run)



