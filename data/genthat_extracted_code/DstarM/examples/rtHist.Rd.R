library(DstarM)


### Name: rtHist
### Title: Make histograms of reaction time data
### Aliases: rtHist

### ** Examples

tt = seq(0, 5, .01)
dat = simData(n = 3e4, pars = rep(.5, 5), tt = tt, pdfND = dbeta(tt, 10, 30))
rtHist(dat, breaks = tt, xlim = c(0, 1))



