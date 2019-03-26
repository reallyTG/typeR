library(tm)


### Name: tm_filter
### Title: Filter and Index Functions on Corpora
### Aliases: tm_filter tm_filter.PCorpus tm_filter.SimpleCorpus
###   tm_filter.VCorpus tm_index tm_index.PCorpus tm_index.SimpleCorpus
###   tm_index.VCorpus

### ** Examples

data("crude")
# Full-text search
tm_filter(crude, FUN = function(x) any(grep("co[m]?pany", content(x))))



