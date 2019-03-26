library(quanteda)


### Name: tokens_recompile
### Title: recompile a serialized tokens object
### Aliases: tokens_recompile
### Keywords: internal tokens

### ** Examples

# lowercasing
toks1 <- tokens(c(one = "a b c d A B C D",
                 two = "A B C d"))
attr(toks1, "types") <- char_tolower(attr(toks1, "types"))
unclass(toks1)
unclass(quanteda:::tokens_recompile(toks1))

# stemming
toks2 <- tokens("Stemming stemmed many word stems.")
unclass(toks2)
unclass(quanteda:::tokens_recompile(tokens_wordstem(toks2)))

# compounding
toks3 <- tokens("One two three four.")
unclass(toks3)
unclass(tokens_compound(toks3, "two three"))

# lookup
dict <- dictionary(list(test = c("one", "three")))
unclass(tokens_lookup(toks3, dict))

# empty pads
unclass(tokens_select(toks3, dict))
unclass(tokens_select(toks3, dict, pad = TRUE))

# ngrams
unclass(tokens_ngrams(toks3, n = 2:3))




