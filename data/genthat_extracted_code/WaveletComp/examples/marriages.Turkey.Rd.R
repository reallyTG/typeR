library(WaveletComp)


### Name: marriages.Turkey
### Title: Series of monthly marriages in Turkey
### Aliases: marriages.Turkey
### Keywords: datasets

### ** Examples

data(marriages.Turkey)
plot(ts(marriages.Turkey$marriages, frequency = 12, start = c(1988,1)), 
     type = "l", 
     xlab = "", ylab = "", 
     main = "monthly marriages in Turkey (1988-2013)")     



