library(stylest)


### Name: stylest_odds
### Title: Pairwise prediction of the most likely speaker of texts
### Aliases: stylest_odds

### ** Examples

data(novels_excerpts)
speaker_mod <- stylest_fit(novels_excerpts$text, novels_excerpts$author)
stylest_odds(speaker_mod, novels_excerpts$text, novels_excerpts$author)
  



