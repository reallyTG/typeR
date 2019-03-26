library(tm.plugin.dc)


### Name: DistributedCorpus
### Title: Distributed Corpus
### Aliases: DCorpus DistributedCorpus as.DCorpus as.DistributedCorpus
###   as.VCorpus.DCorpus

### ** Examples

## Similar to example in package 'tm'
reut21578 <- system.file("texts", "crude", package = "tm")
dc <- DistributedCorpus(DirSource(reut21578),
readerControl = list(reader = readReut21578XMLasPlain) )
dc

## Coercion
data("crude")
as.DistributedCorpus(crude)
as.VCorpus(dc)



