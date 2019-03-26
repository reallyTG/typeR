library(nzilbb.labbcat)


### Name: labbcat.getCorpusIds
### Title: Gets a list of corpus IDs.
### Aliases: labbcat.getCorpusIds
### Keywords: corpora

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List corpora
corpora <- labbcat.getCorpusIds(labbcat)




