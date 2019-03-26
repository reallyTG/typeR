library(disco)


### Name: makeSummary
### Title: Common modules in specified comparisons
### Aliases: makeSummary

### ** Examples

library(tmod)
data(tmod)
data(orthologs)
disco <- disco.score(orthologs)
g <- toupper(orthologs$genes)
concordant <- tmodCERNOtest(g[order(disco, decreasing = TRUE)])
discordant <- tmodCERNOtest(g[order(disco)])
sum1 <- makeSummary(concordant, discordant)



