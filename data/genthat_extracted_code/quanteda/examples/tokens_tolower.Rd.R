library(quanteda)


### Name: tokens_tolower
### Title: Convert the case of tokens
### Aliases: tokens_tolower tokens_toupper

### ** Examples

# for a document-feature matrix
toks <- tokens(c(txt1 = "b A A", txt2 = "C C a b B"))
tokens_tolower(toks) 
tokens_toupper(toks)



