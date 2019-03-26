library(textometry)


### Name: robespierre
### Title: 5 words from Robespierre's discourses
### Aliases: robespierre
### Keywords: datasets

### ** Examples

data(robespierre)

## See graphic in Lafon, 1980 - page 140

t <- colSums(robespierre)["D9"];     # size of the part
T <- sum(robespierre);               # size of the corpus
f <- rowSums(robespierre)["peuple"]; # total frequency of "peuple"
p <- dhyper(1:15, f, T-f, t)
title <- "Probability of each frequency of 'peuple' in the 'D9' discourse from 1 to 15"
plot(p, type="h", main=title, xlab="k", ylab="Prob(k)");



