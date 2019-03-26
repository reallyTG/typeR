library(TDPanalysis)


### Name: remove.fun
### Title: Remove unwanted dates
### Aliases: remove.fun

### ** Examples

DOY = c(rep(102, times=10), rep(103, times=10))
ID = c(rep("A", times=5), rep("B", times=5), rep("A", times=5), rep("B", times=5))
Tmax = c(rep(2.5, times=5), rep(2.7, times=5), rep(3.2, times=5), rep(3.4, times=5))
df <- data.frame(DOY, ID, Tmax)
dates = c("103")
remove.fun(df=df, dates=dates) 



