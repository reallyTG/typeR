library(qdap)


### Name: synonyms
### Title: Search For Synonyms
### Aliases: synonyms syn synonyms_frame syn_frame

### ** Examples

## Not run: 
##D synonyms(c("the", "cat", "job", "environment", "read", "teach"))
##D head(syn(c("the", "cat", "job", "environment", "read", "teach"), 
##D     return.list = FALSE), 30)
##D syn(c("the", "cat", "job", "environment", "read", "teach"), multiwords = FALSE)
##D 
##D ## User defined synonym lookup
##D syn_dat <- list(
##D     like = list(c("want", "desire"), c("love", "care")),
##D     show = list(c("reveal"), c("movie", "opera")),
##D     R = c("old friend", "statistics language")
##D )
##D 
##D synonyms_frame(syn_dat)
##D syn(c("R", "show"), synonym.frame = syn_frame(syn_dat))
##D 
##D syns.hash <- syn_frame(syn_dat, prior.frame = qdapDictionaries::key.syn)
##D syn(c("R", "show", "like", "robot"), synonym.frame = syns.hash)
## End(Not run)



