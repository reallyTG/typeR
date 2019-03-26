library(rbitcoinchartsapi)


### Name: GetMarketData
### Title: This function will return an array with elements for each
###   market.
### Aliases: GetMarketData

### ** Examples

params <- list (currency="USD")
 tryCatch(
     usd <- GetMarketData (params),
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



