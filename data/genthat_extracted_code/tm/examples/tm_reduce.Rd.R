library(tm)


### Name: tm_reduce
### Title: Combine Transformations
### Aliases: tm_reduce

### ** Examples

data(crude)
crude[[1]]
skipWords <- function(x) removeWords(x, c("it", "the"))
funs <- list(stripWhitespace,
             skipWords,
             removePunctuation,
             content_transformer(tolower))
tm_map(crude, FUN = tm_reduce, tmFuns = funs)[[1]]



