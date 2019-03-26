library(rbitcoinchartsapi)


### Name: GetWeightedPrices
### Title: This function returns the weighted prices.
### Aliases: GetWeightedPrices

### ** Examples

tryCatch(
     weightedPrices <- GetWeightedPrices (),
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



