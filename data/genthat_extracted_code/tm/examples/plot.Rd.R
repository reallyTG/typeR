library(tm)


### Name: plot
### Title: Visualize a Term-Document Matrix
### Aliases: plot.TermDocumentMatrix

### ** Examples

## Not run: 
##D data(crude)
##D tdm <- TermDocumentMatrix(crude,
##D                           control = list(removePunctuation = TRUE,
##D                                          removeNumbers = TRUE,
##D                                          stopwords = TRUE))
##D plot(tdm, corThreshold = 0.2, weighting = TRUE)
## End(Not run)



