library(HRW)


### Name: TreasuryRate
### Title: U.S. Treasury rate
### Aliases: TreasuryRate

### ** Examples

library(HRW) ; data(TreasuryRate)
TRdate <- as.Date(TreasuryRate$date,"%m/%d/%Y")[!is.na(TreasuryRate$rate)]
TRrate <- TreasuryRate$rate[!is.na(TreasuryRate$rate)]
plot(TRdate,TRrate,type = "l",bty = "l",xlab = "date",ylab = "U.S. Treasury rate")



