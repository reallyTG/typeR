library(Trading)


### Name: BondFuture-class
### Title: Bond Future Class
### Aliases: BondFuture

### ** Examples


example_trades = ParseTrades()
bondfuture_trade = example_trades[[17]]
tr1 = BondFuture(Notional=10000,MtM=30,Currency="EUR",Si=0,Ei=10,BuySell='Buy',
payment_frequency="SA",coupon_type="Fixed",Issuer="CountryA",ISIN = "XS0943423")



