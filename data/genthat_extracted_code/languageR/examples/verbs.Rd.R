library(languageR)


### Name: verbs
### Title: Dative Alternation - simplified data set
### Aliases: verbs
### Keywords: datasets

### ** Examples

data(verbs)
head(verbs)
xtabs( ~ RealizationOfRec + AnimacyOfRec, data = verbs)
barplot(xtabs( ~ RealizationOfRec + AnimacyOfRec, data = verbs),beside=TRUE)



