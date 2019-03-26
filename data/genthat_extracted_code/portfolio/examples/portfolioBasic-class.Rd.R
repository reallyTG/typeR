library(portfolio)


### Name: portfolioBasic-class
### Title: Class "portfolioBasic"
### Aliases: portfolioBasic-class +,portfolioBasic,portfolioBasic-method
###   all.equal,portfolioBasic,portfolioBasic-method
###   balance,portfolioBasic,character-method
###   contribution,portfolioBasic,character-method
###   create,portfolioBasic-method exposure,portfolioBasic,character-method
###   matching,portfolioBasic-method performance,portfolioBasic-method
###   plot,portfolioBasic,missing-method
###   portfolioDiff,portfolioBasic,portfolioBasic-method
###   scaleWeights,portfolioBasic-method show,portfolioBasic-method
###   summary,portfolioBasic-method initialize,portfolioBasic-method
###   mapMarket,portfolioBasic-method balance contribution create exposure
###   matching performance portfolioDiff scaleWeights mapMarket
###   portfolioBasicOrNull-class
### Keywords: classes

### ** Examples

data(dow.jan.2005)

p <- new("portfolioBasic",
         id.var = "symbol",
         in.var = "price",
         sides = "long",
         ret.var = "month.ret",
         data = dow.jan.2005)

summary(p)

exposure(p, exp.var = c("price", "sector"))
performance(p)
contribution(p, contrib.var = c("cap.bil", "sector"))

p <- new("portfolioBasic",
         id.var = "symbol",
         in.var = "price",
         type = "linear",
         sides = c("long", "short"),
         ret.var = "month.ret",
         data = dow.jan.2005)

summary(p)

exposure(p, exp.var = c("price", "sector"))
performance(p)
contribution(p, contrib.var = c("cap.bil","sector"))



