library(udpipe)


### Name: txt_next
### Title: Get the n-th next element of a vector
### Aliases: txt_next

### ** Examples

x <- sprintf("%s%s", LETTERS, 1:26)
txt_next(x, n = 1)

data.frame(word = x,
           word_next1 = txt_next(x, n = 1),
           word_next2 = txt_next(x, n = 2),
           stringsAsFactors = FALSE)



