library(optiRum)


### Name: RATE
### Title: Calculates compounded interest rate
### Aliases: RATE
### Keywords: financial pmt pv rate

### ** Examples

RATE(12,-500,3000) # 0.126947 Taken from excel

df<-data.frame(nper=c(12,12),pmt=c(-500,-400),pv=c(3000,3000))
RATE(df$nper,df$pmt,df$pv)  # c(0.126947,0.080927) Taken from excel



