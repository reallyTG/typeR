library(ExPanDaR)


### Name: prepare_regression_table
### Title: Prepares a Regression Table
### Aliases: prepare_regression_table

### ** Examples

df <- data.frame(year = as.factor(floor(stats::time(datasets::EuStockMarkets))),
                 datasets::EuStockMarkets)
dvs = c("DAX", "SMI", "CAC", "FTSE")
idvs = list(c("SMI", "CAC", "FTSE"),
            c("DAX", "CAC", "FTSE"),
            c("SMI", "DAX", "FTSE"),
            c("SMI", "CAC", "DAX"))
feffects = list("year", "year", "year", "year")
clusters = list("year", "year", "year", "year")
t <- prepare_regression_table(df, dvs, idvs, feffects, clusters, format = "text")
t$table
t <- prepare_regression_table(df, "DAX", c("SMI", "CAC", "FTSE"), byvar="year", format = "text")
print(t$table)



