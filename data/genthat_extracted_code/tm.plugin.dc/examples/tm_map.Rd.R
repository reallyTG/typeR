library(tm.plugin.dc)


### Name: tm_map.DCorpus
### Title: Transformations on Distributed Corpora
### Aliases: tm_map.DCorpus

### ** Examples

data("crude")
tm_map(as.DCorpus(crude), content_transformer(tolower))



