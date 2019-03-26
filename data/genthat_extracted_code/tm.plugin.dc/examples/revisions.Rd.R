library(tm.plugin.dc)


### Name: Revisions
### Title: Revisions of a Distributed Corpus
### Aliases: getRevisions removeRevision setRevision keepRevisions
###   keepRevisions<-

### ** Examples

## provide data on storage
data("crude")
dc <- as.DCorpus(crude)
## do some preprocessing
dc <- tm_map(dc, content_transformer(tolower))
## retrieve available revisions
revs <- getRevisions(dc)
revs
## go back to original revision
setRevision(dc, revs[2])
keepRevisions(dc)
keepRevisions(dc) <- FALSE



