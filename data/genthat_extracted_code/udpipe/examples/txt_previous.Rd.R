library(udpipe)


### Name: txt_previous
### Title: Get the n-th previous element of a vector
### Aliases: txt_previous

### ** Examples

x <- sprintf("%s%s", LETTERS, 1:26)
txt_previous(x, n = 1)

data.frame(word = x,
           word_previous1 = txt_previous(x, n = 1),
           word_previous2 = txt_previous(x, n = 2),
           stringsAsFactors = FALSE)



