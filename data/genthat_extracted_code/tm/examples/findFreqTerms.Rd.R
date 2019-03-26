library(tm)


### Name: findFreqTerms
### Title: Find Frequent Terms
### Aliases: findFreqTerms

### ** Examples

data("crude")
tdm <- TermDocumentMatrix(crude)
findFreqTerms(tdm, 2, 3)



