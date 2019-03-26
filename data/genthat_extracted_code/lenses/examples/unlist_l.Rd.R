library(lenses)


### Name: unlist_l
### Title: Unlist lens
### Aliases: unlist_l
### Keywords: datasets

### ** Examples

(x <- list(x = list(y = 1:10)))
view(x, unlist_l)
set(x, unlist_l %.% unlist_l, rep("hello", 10))



