library(ConConPiWiFun)


### Name: OptimPriceStorage
### Title: Optimisation of storage operation with market prices taking into
###   acount storage efficiency and network taxes.
### Aliases: ComputeMarketPrices OptimPriceMarket_l OptimPriceMarket_q
###   OptimPriceStorage OptimPriceStorage_
### Keywords: ~kwd1 ~kwd2

### ** Examples




n=8760
Prices=runif(n,1,100) ##uniform random prices in [1;100] in Euro/MWh
Pmax=1; Pmin=-1; Cmax=5; ## 1MW maximum  during 5 hours.
res=OptimPriceStorage(Prices,Pmax,Pmin,Cmax) # solving the optimization problem
sum(res$Revenue)## Revenue
res=OptimPriceStorage(Prices,Pmax,Pmin,Cmax,efficiencyS=0.8) # solving the optimization problem
sum(res$Revenue)## Revenue




