library(optiRum)


### Name: PMT
### Title: Calculates the repayment for a loan
### Aliases: PMT
### Keywords: financial pmt pv

### ** Examples

PMT(0.1,12,3000) # =-440.29 taken from excel

df<-data.frame(rate=c(.1,.2),nper=c(12,24),pv=c(3000,1000))
PMT(df$rate,df$nper,df$pv) # =-440.29,-202.55 taken from excel



