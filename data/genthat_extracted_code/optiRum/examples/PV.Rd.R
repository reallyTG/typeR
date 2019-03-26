library(optiRum)


### Name: PV
### Title: Calculates the present value
### Aliases: PV
### Keywords: financial pmt pv

### ** Examples

PV(0.1,12,-10) # 68.14 Taken from excel

df<-data.frame(rate=c(.1,.1),nper=c(12,24),pmt=c(-10,-15))
PV(df$rate,df$nper,df$pmt)  # c(68.14,134.77) Taken from excel



