library(bibliometrix)


### Name: mergeDbSources
### Title: Merge bibliographic data frames from SCOPUS and ISI WOS
### Aliases: mergeDbSources

### ** Examples

 
data(isiCollection)

data(scopusCollection)

M <- mergeDbSources(isiCollection, scopusCollection, remove.duplicated=TRUE)

dim(M)





