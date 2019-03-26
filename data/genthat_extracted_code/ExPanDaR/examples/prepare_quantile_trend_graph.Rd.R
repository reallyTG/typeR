library(ExPanDaR)


### Name: prepare_quantile_trend_graph
### Title: Prepares a Quantile Trend Graph
### Aliases: prepare_quantile_trend_graph

### ** Examples

prepare_quantile_trend_graph(worldbank, "year", var = "SP.DYN.LE00.IN")$plot +
  ggplot2::ylab("Life expectancy at birth world-wide")
df <- data.frame(year = floor(stats::time(datasets::EuStockMarkets)),
                 DAX = datasets::EuStockMarkets[,"DAX"])
graph <- prepare_quantile_trend_graph(df, "year", c(0.05, 0.25, 0.5, 0.75, 0.95))
graph$plot



