library(xfun)


### Name: prose_index
### Title: Find the indices of lines in Markdown that are prose (not code
###   blocks)
### Aliases: prose_index

### ** Examples

library(xfun)
prose_index(c("a", "```", "b", "```", "c"))
prose_index(c("a", "````", "```r", "1+1", "```", "````", "c"))



