library(nzilbb.labbcat)


### Name: labbcat.getGraphIdsInCorpus
### Title: Gets a list of corpus IDs.
### Aliases: labbcat.getGraphIdsInCorpus
### Keywords: corpora corpus

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List corpora
corpora <- labbcat.getCorpusIds(labbcat)




