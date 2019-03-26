library(optiRum)


### Name: APR
### Title: Calculates the compound interest rate for a loan
### Aliases: APR
### Keywords: apr financial pmt pv

### ** Examples

# single set of values
APR(12,-10,110) 

# vector of values
df<-data.frame(nper=c(12,24),pmt=c(-10,-10),pv=c(110,220))
APR(df$nper,df$pmt,df$pv)




