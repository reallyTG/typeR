library(TDPanalysis)


### Name: Tmaxplot
### Title: Plot the Tmax
### Aliases: Tmaxplot

### ** Examples

DOY = c(rep(102, times=10), rep(103, times=10))
ID = c(rep("A", times=5), rep("B", times=5), rep("A", times=5), rep("B", times=5))
Tmax = c(rep(0.7512, times=5), rep(0.7359, times=5),rep(0.7644, times=5),rep(0.7666, times=5))
df <- data.frame(DOY, ID, Tmax)
Tmaxplot(df)



