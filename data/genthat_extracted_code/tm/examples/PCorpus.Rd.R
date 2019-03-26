library(tm)


### Name: PCorpus
### Title: Permanent Corpora
### Aliases: PCorpus

### ** Examples

txt <- system.file("texts", "txt", package = "tm")
## Not run: 
##D PCorpus(DirSource(txt),
##D         dbControl = list(dbName = "pcorpus.db", dbType = "DB1"))
## End(Not run)



