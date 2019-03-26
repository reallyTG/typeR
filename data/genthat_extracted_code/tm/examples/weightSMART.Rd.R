library(tm)


### Name: weightSMART
### Title: SMART Weightings
### Aliases: weightSMART

### ** Examples

data("crude")
TermDocumentMatrix(crude,
                   control = list(removePunctuation = TRUE,
                                  stopwords = TRUE,
                                  weighting = function(x)
                                  weightSMART(x, spec = "ntc")))



