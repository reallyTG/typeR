library(quanteda)


### Name: tokens_replace
### Title: Replace types in tokens object
### Aliases: tokens_replace

### ** Examples

toks <- tokens(data_corpus_irishbudget2010)

# lemmatization
infle <- c("foci", "focus", "focused", "focuses", "focusing", "focussed", "focusses")
lemma <- rep("focus", length(infle))
toks2 <- tokens_replace(toks, infle, lemma)
kwic(toks2, "focus*")

# stemming
type <- types(toks)
stem <- char_wordstem(type, "porter")
toks3 <- tokens_replace(toks, type, stem, case_insensitive = FALSE)
identical(toks3, tokens_wordstem(toks, "porter"))



