library(TSstudio)


### Name: zoo_to_ts
### Title: Converting 'zoo' object to 'ts' object
### Aliases: zoo_to_ts

### ** Examples


data("EURO_Brent", package = "TSstudio")
class(EURO_Brent)
ts_plot(EURO_Brent)
EURO_Brent_ts <- zoo_to_ts(EURO_Brent)
class(EURO_Brent_ts)
ts_plot(EURO_Brent_ts)



