library(tm)


### Name: inspect
### Title: Inspect Objects
### Aliases: inspect inspect.PCorpus inspect.TermDocumentMatrix
###   inspect.TextDocument inspect.VCorpus

### ** Examples

data("crude")
inspect(crude[1:3])
inspect(crude[[1]])
tdm <- TermDocumentMatrix(crude)[1:10, 1:10]
inspect(tdm)



