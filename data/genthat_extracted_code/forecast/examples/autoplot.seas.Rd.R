library(forecast)


### Name: autoplot.decomposed.ts
### Title: Plot time series decomposition components using ggplot
### Aliases: autoplot.decomposed.ts autoplot.stl autoplot.StructTS
###   autoplot.seas autoplot.mstl

### ** Examples


library(ggplot2)
co2 %>% decompose %>% autoplot
nottem %>% stl(s.window='periodic') %>% autoplot

## Not run: 
##D library(seasonal)
##D seas(USAccDeaths) %>% autoplot
## End(Not run)




