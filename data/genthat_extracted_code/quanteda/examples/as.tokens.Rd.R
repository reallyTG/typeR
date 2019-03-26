library(quanteda)


### Name: as.tokens
### Title: Coercion, checking, and combining functions for tokens objects
### Aliases: as.tokens as.tokens.list as.tokens.spacyr_parsed
###   as.list.tokens unlist.tokens as.character.tokens is.tokens +.tokens
###   c.tokens

### ** Examples


# create tokens object from list of characters with custom concatenator
dict <- dictionary(list(country = "United States", 
                   sea = c("Atlantic Ocean", "Pacific Ocean")))
lis <- list(c("The", "United-States", "has", "the", "Atlantic-Ocean", 
              "and", "the", "Pacific-Ocean", "."))
toks <- as.tokens(lis, concatenator = "-")
tokens_lookup(toks, dict)

# combining tokens
toks1 <- tokens(c(doc1 = "a b c d e", doc2 = "f g h"))
toks2 <- tokens(c(doc3 = "1 2 3"))
toks1 + toks2
c(toks1, toks2)




