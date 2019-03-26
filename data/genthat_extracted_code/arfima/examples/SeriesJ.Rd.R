library(arfima)


### Name: SeriesJ
### Title: Series J, Gas Furnace Data
### Aliases: SeriesJ
### Keywords: datasets

### ** Examples


data(SeriesJ)
attach(SeriesJ)

fitTF <- arfima(YJ, order= c(2, 0, 0), xreg = XJ, reglist =
list(regpar = c(2, 2, 3)), lmodel = "n")
fitTF ## agrees fairly closely with Box et. al.


detach(SeriesJ)




