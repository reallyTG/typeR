library(ptstem)


### Name: ptstem_words
### Title: Stem Words
### Aliases: ptstem ptstem_words

### ** Examples

words <- c("balões", "aviões", "avião", "gostou", "gosto", "gostaram")
ptstem_words(words, "hunspell")
ptstem_words(words)
ptstem_words(words, algorithm = "porter", complete = FALSE)

texts <- c("coma frutas pois elas fazem bem para a saúde.",
"não coma doces, eles fazem mal para os dentes.")
ptstem(texts, "hunspell")
ptstem(texts, n_char = 5)
ptstem(texts, "porter", n_char = 4, complete = FALSE)
ptstem(words, ignore = "av.*") # words starting with "av" are not stemmed





