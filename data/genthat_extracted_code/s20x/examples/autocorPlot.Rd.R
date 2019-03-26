library(s20x)


### Name: autocorPlot
### Title: Autocorrelation Plot
### Aliases: autocorPlot autocor.plot
### Keywords: hplot

### ** Examples


data(airpass.df)
time = 1:144
airpass.fit = lm(passengers ~ time, data = airpass.df)
autocorPlot(airpass.fit)




