library(betategarch)


### Name: nasdaq
### Title: Daily Apple stock returns
### Aliases: nasdaq
### Keywords: datasets

### ** Examples

data(nasdaq) #load data into workspace
mymod <- tegarch(nasdaq[,"nasdaqret"]) #estimate volatility model of Apple returns
print(mymod)



