library(ExPanDaR)


### Name: prepare_trend_graph
### Title: Prepares a Trend Graph
### Aliases: prepare_trend_graph

### ** Examples

df <- data.frame(year = floor(time(EuStockMarkets)), EuStockMarkets)
graph <- prepare_trend_graph(df, "year")
graph$plot



