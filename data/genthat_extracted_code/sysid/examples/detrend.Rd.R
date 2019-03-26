library(sysid)


### Name: detrend
### Title: Remove offsets and linear trends
### Aliases: detrend trInfo

### ** Examples

data(cstr)
datatrain <- dataSlice(cstr,end=4500)
datatest <- dataSlice(cstr,4501)
g(Ztrain,tr) %=% detrend(datatrain) # Remove means
g(Ztest) %=% detrend(datatest,tr)




