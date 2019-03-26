library(tm)


### Name: findAssocs
### Title: Find Associations in a Term-Document Matrix
### Aliases: findAssocs findAssocs.DocumentTermMatrix
###   findAssocs.TermDocumentMatrix

### ** Examples

data("crude")
tdm <- TermDocumentMatrix(crude)
findAssocs(tdm, c("oil", "opec", "xyz"), c(0.7, 0.75, 0.1))



