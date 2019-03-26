library(portfolio)


### Name: map.market
### Title: Create a Map of the Market
### Aliases: map.market
### Keywords: file

### ** Examples

data(dow.jan.2005)
map.market(id    = dow.jan.2005$symbol,
           area  = dow.jan.2005$price,
           group = dow.jan.2005$sector,
           color = 100 * dow.jan.2005$month.ret)




