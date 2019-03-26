library(TTR)


### Name: stockSymbols
### Title: Fetch Internet Data
### Aliases: stockSymbols WebData getYahooData getYahooData
### Keywords: ts

### ** Examples


### Note: you must have a working internet
### connection for these examples to work!
if (interactive()) {
  ge <- getYahooData("GE", 19990404, 20050607, adjust = FALSE)

  nyse.symbols <- stockSymbols("NYSE")
}




