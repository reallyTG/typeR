library(DescTools)


### Name: Phrase
### Title: Phrasing Results of t-Test
### Aliases: Phrase
### Keywords: character

### ** Examples

data("cats", package = "MASS")
cat(Phrase(cats$Bwt, cats$Sex, xname="weight", unit="grams", glabels=c("female", "male")))

# oder auf deutsch
cat(Phrase(cats$Bwt, cats$Sex, xname="Geburtsgewicht",
           glabels=c("weiblich", "maennlich"), lang="german"))



