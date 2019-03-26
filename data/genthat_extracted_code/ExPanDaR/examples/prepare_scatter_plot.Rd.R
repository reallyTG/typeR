library(ExPanDaR)


### Name: prepare_scatter_plot
### Title: Prepares a Scatter Plot
### Aliases: prepare_scatter_plot

### ** Examples

df <- data.frame(year = floor(stats::time(datasets::EuStockMarkets)),
                 datasets::EuStockMarkets[, c("DAX", "FTSE")])
prepare_scatter_plot(df, x="DAX", y="FTSE", color="year")



