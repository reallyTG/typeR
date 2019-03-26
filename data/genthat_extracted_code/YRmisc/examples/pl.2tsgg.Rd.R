library(YRmisc)


### Name: pl.2tsgg
### Title: Time series plot for two variables with ggplot2
### Aliases: pl.2tsgg

### ** Examples

DAX <- EuStockMarkets[,1]
FTSE <- EuStockMarkets[,4]
pl.2tsgg(DAX,FTSE, "Times Series Plot of DAX and FTSE", "Index")



