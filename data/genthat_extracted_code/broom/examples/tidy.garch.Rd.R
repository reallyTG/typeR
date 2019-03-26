library(broom)


### Name: tidy.garch
### Title: Tidy a(n) garch object
### Aliases: tidy.garch garch_tidiers

### ** Examples


library(tseries)

data(EuStockMarkets)
dax <- diff(log(EuStockMarkets))[,"DAX"]
dax.garch <- garch(dax)
dax.garch

tidy(dax.garch)
glance(dax.garch)




