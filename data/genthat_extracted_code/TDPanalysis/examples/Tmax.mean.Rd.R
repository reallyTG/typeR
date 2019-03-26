library(TDPanalysis)


### Name: Tmax.mean
### Title: Calculate a mean of Tmax
### Aliases: Tmax.mean

### ** Examples

ID = c(rep("A", times=5), rep("B", times=5), rep("A", times=5), rep("B", times=5))
Tmax = c(rep(2.5, times=5), rep(2.7, times=5), rep(3.2, times=5), rep(3.4, times=5))
DOY = c(rep(102, times=10), rep(103, times=10))
df <- data.frame(DOY, ID, Tmax)
Tmax.mean(df)



