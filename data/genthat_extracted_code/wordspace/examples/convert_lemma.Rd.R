library(wordspace)


### Name: convert.lemma
### Title: Transform CWB/Penn-Style Lemmas into Other Notation Formats
###   (wordspace)
### Aliases: convert.lemma

### ** Examples


convert.lemma(RG65$word1, "CWB") # original format
convert.lemma(RG65$word1, "BNC") # BNC-style (simple CLAWS tags)
convert.lemma(RG65$word1, "DM")  # as in Distributional Memory
convert.lemma(RG65$word1, "HW")  # just the headword




