library(Trading)


### Name: CommodityForward-class
### Title: Commodity Forward Class
### Aliases: CommodityForward

### ** Examples


## the Commodity Forward trade given in the Basel regulation Commodity example
tr1 = CommodityForward(Notional=10000,MtM=-50,Si=0,Ei=0.75,
BuySell='Buy',SubClass='Energy',commodity_type='Oil/Gas')



