library(rbitcoinchartsapi)


### Name: GetHistoricTradeData
### Title: This function will return the 2000 most recent trades which are
###   delayed by approximately 15 minutes.
### Aliases: GetHistoricTradeData

### ** Examples

params <- list (symbol="btceUSD")
 tryCatch(
     historicTradeData <- GetHistoricTradeData (params),
     error =
         function (e) {
             print (
                 paste (
                     "An exception was thrown -- details follow: ",
                     e,
                     sep=""
                 )
             )
         }
     )



