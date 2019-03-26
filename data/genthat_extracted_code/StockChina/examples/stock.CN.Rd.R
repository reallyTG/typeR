library(StockChina)


### Name: stock.CN
### Title: Grab Real-Time Stock Price & Volume Information in China Market
### Aliases: stock.CN

### ** Examples

symbol <- "601898"
symbols <- c("601898", "000001")

stock.CN(symbol)
sapply(symbols, stock.CN)



