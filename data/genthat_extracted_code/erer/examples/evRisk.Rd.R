library(erer)


### Name: evRisk
### Title: Risk Evaluation for Event Analysis
### Aliases: evRisk print.evRisk
### Keywords: regression

### ** Examples


data(daEsa)

hh <- evReturn(y = daEsa, firm = "wpp", 
   y.date = "date", index = "sp500", est.win = 250, digits = 3,
   event.date = 19990505, event.win = 5)
hh2 <- update(hh, firm = c("tin", "wy", "pcl", "pch"))

kk <- evRisk(x = hh2, m = 100, r.free="tb3m")
kk




