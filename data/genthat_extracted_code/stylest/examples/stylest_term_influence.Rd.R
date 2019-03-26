library(stylest)


### Name: stylest_term_influence
### Title: Compute the influence of terms
### Aliases: stylest_term_influence

### ** Examples

data(novels_excerpts)
speaker_mod <- stylest_fit(novels_excerpts$text, novels_excerpts$author)
stylest_term_influence(speaker_mod, novels_excerpts$text, novels_excerpts$author)
  



