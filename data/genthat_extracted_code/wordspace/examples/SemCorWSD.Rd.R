library(wordspace)


### Name: SemCorWSD
### Title: SemCor Word Sense Disambiguation Task (wordspace)
### Aliases: SemCorWSD
### Keywords: datasets

### ** Examples


with(SemCorWSD, table(sense, target))

# all word senses with brief definitions ("glosses")
with(SemCorWSD, sort(unique(paste0(target, " ", sense, ": ", gloss))))




