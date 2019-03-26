library(ngram)


### Name: Tokenize
### Title: n-gram Tokenization
### Aliases: Tokenize tokenize ngram ngram,character-method
### Keywords: Tokenization

### ** Examples

library(ngram)

str <- "A B A C A B B"
ngram(str, n=2)

str <- "A,B,A,C A B B"
### Split at a space
print(ngram(str), output="full")
### Split at a comma
print(ngram(str, sep=","), output="full")
### Split at a space or a comma
print(ngram(str, sep=", "), output="full")




