library(Trading)


### Name: IRDSwaption-class
### Title: IRD Swaption Class
### Aliases: IRDSwaption

### ** Examples


# the Swaption trade given in the Basel regulation IRD example
tr3 = IRDSwaption(Notional=5000,MtM=50,Currency="EUR",Si=1,Ei=11,BuySell='Sell',
OptionType='Put',UnderlyingPrice=0.06,StrikePrice=0.05)



