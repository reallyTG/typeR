library(BSDA)


### Name: Rural
### Title: Social adjustment scores for a rural group and a city group of
###   children
### Aliases: Rural
### Keywords: datasets

### ** Examples


boxplot(score ~ area, data = Rural)
wilcox.test(score ~ area, data = Rural)
## Not run: 
##D library(dplyr)
##D Rural <- dplyr::mutate(Rural, r = rank(score))
##D Rural
##D t.test(r ~ area, data = Rural)
## End(Not run)




