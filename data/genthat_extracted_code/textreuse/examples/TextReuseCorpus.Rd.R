library(textreuse)


### Name: TextReuseCorpus
### Title: TextReuseCorpus
### Aliases: TextReuseCorpus is.TextReuseCorpus skipped

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
corpus <- TextReuseCorpus(dir = dir, meta = list("description" = "Field Codes"))
# Subset by position or file name
corpus[[1]]
names(corpus)
corpus[["ca1851-match"]]




