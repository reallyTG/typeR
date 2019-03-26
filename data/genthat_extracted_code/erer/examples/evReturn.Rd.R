library(erer)


### Name: evReturn
### Title: Estimating Abnormal Return from Event Analysis
### Aliases: evReturn print.evReturn plot.evReturn
### Keywords: regression

### ** Examples

data(daEsa)

# event analysis for one firm and one event window
hh <- evReturn(y = daEsa, firm = "wpp", 
   y.date = "date", index = "sp500", est.win = 250, digits = 3,
   event.date = 19990505, event.win = 5)
hh; plot(hh)

# event analysis for many firms and one event window
hh2 <- update(hh, firm = c("tin", "wy", "pcl", "pch")); hh2

# event analysis for many firms and many event windows: need a for loop




