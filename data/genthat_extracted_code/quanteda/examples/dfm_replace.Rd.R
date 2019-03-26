library(quanteda)


### Name: dfm_replace
### Title: Replace features in dfm
### Aliases: dfm_replace

### ** Examples

mydfm <- dfm(data_corpus_irishbudget2010)

# lemmatization
infle <- c("foci", "focus", "focused", "focuses", "focusing", "focussed", "focusses")
lemma <- rep("focus", length(infle))
mydfm2 <- dfm_replace(mydfm, infle, lemma)
featnames(dfm_select(mydfm2, infle))

# stemming
feat <- featnames(mydfm)
stem <- char_wordstem(feat, "porter")
mydfm3 <- dfm_replace(mydfm, feat, stem, case_insensitive = FALSE)
identical(mydfm3, dfm_wordstem(mydfm, "porter"))



