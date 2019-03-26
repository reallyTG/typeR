library(quanteda)


### Name: tokens_wordstem
### Title: Stem the terms in an object
### Aliases: tokens_wordstem char_wordstem dfm_wordstem

### ** Examples

# example applied to tokens
txt <- c(one = "eating eater eaters eats ate",
         two = "taxing taxes taxed my tax return")
th <- tokens(txt)
tokens_wordstem(th)

# simple example
char_wordstem(c("win", "winning", "wins", "won", "winner"))

# example applied to a dfm
(origdfm <- dfm(txt))
dfm_wordstem(origdfm)




