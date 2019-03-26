library(qdap)


### Name: prop
### Title: Convert Raw Numeric Matrix or Data Frame to Proportions
### Aliases: prop
### Keywords: percent, percentage proportion,

### ** Examples

## Not run: 
##D y <- wfdf(DATA$state, DATA$person, stopwords = c("your", "yours"), 
##D     margins = TRUE)
##D prop(wfm(y), 4)[1:10, ]        #as a proportion
##D prop(wfm(y), 4, TRUE)[1:10, ]  #as a percentage
##D heatmap(prop(wfm(y), 4))
##D wdstraj <- word_stats(rajSPLIT$dialogue, rajSPLIT$person)
##D prop(wdstraj$gts[, -1], 5)[1:15, 1:6]
## End(Not run)



