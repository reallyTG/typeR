library(languageR)


### Name: oldFrench
### Title: Frequencies of tag trigrams in Old French texts
### Aliases: oldFrench
### Keywords: datasets

### ** Examples

data(oldFrench)
data(oldFrenchMeta)

oldFrench.ca = corres.fnc(oldFrench)

plot(oldFrench.ca, rlabels = oldFrenchMeta$Genre, 
rcol = as.numeric(oldFrenchMeta$Genre), rcex = 0.5, 
extreme = 0.1, ccol = "blue")



