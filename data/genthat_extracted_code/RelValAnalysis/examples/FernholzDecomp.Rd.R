library(RelValAnalysis)


### Name: FernholzDecomp
### Title: Fernholz's Decomposition for a Buy-and-hold Toy Market
### Aliases: FernholzDecomp

### ** Examples

# Plot the Fernholz decomposition for the entropy-weighted portfolio
data(applestarbucks)
market <- toymkt(applestarbucks)
output <- FernholzDecomp(market, EntropyPortfolio, plot = TRUE)



