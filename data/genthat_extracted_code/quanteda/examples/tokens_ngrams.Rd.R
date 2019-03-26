library(quanteda)


### Name: tokens_ngrams
### Title: Create ngrams and skipgrams from tokens
### Aliases: tokens_ngrams char_ngrams tokens_skipgrams

### ** Examples

# ngrams
tokens_ngrams(tokens(c("a b c d e", "c d e f g")), n = 2:3)

toks <- tokens(c(text1 = "the quick brown fox jumped over the lazy dog"))
tokens_ngrams(toks, n = 1:3)
tokens_ngrams(toks, n = c(2,4), concatenator = " ")
tokens_ngrams(toks, n = c(2,4), skip = 1, concatenator = " ")

# on character
char_ngrams(letters[1:3], n = 1:3)

# skipgrams
toks <- tokens("insurgents killed in ongoing fighting")
tokens_skipgrams(toks, n = 2, skip = 0:1, concatenator = " ") 
tokens_skipgrams(toks, n = 2, skip = 0:2, concatenator = " ") 
tokens_skipgrams(toks, n = 3, skip = 0:2, concatenator = " ")   



