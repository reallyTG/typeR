library(PortfolioAnalytics)


### Name: meucci.ranking
### Title: Asset Ranking
### Aliases: meucci.ranking

### ** Examples

data(edhec)
R <- edhec[,1:4]
p <- rep(1 / nrow(R), nrow(R))
meucci.ranking(R, p, c(2, 3, 1, 4))



