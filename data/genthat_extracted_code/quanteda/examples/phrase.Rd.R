library(quanteda)


### Name: phrase
### Title: Declare a compound character to be a sequence of separate
###   pattern matches
### Aliases: phrase is.phrase

### ** Examples

# make phrases from characters
phrase(c("a b", "c d e", "f"))

# from a dictionary
phrase(dictionary(list(catone = c("a b"), cattwo = "c d e", catthree = "f")))

# from a collocations object
(coll <- textstat_collocations(tokens("a b c a b d e b d a b")))
phrase(coll)



