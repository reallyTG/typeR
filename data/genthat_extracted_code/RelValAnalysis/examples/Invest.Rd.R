library(RelValAnalysis)


### Name: Invest
### Title: Investing in a Toy Market
### Aliases: Invest

### ** Examples

# Performance of the equal-weighted portfolio
data(applestarbucks)
market <- toymkt(applestarbucks)
weight <- c(0.5, 0.5)  # equal-weighted portfolio
result <- Invest(market, weight, plot = TRUE)



