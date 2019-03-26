library(MESS)


### Name: conditional_rowMeans
### Title: Parallel means conditional on number of non-missing
### Aliases: conditional_rowMeans

### ** Examples

conditional_rowMeans(1:5, c(1:4, NA), c(1:3, NA, NA))
conditional_rowMeans(1:5, c(1:4, NA), c(1:3, NA, NA), minobs=0)
conditional_rowMeans(1:5, c(1:4, NA), c(1:3, NA, NA), minobs=2)




