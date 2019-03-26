library(DstarM)


### Name: simData
### Title: Simulate data from a given densitiy function via multinomial
###   sampling
### Aliases: simData

### ** Examples

tt = seq(0, 5, .01)
pdfND = dbeta(tt, 10, 30)
n = 100
pars = c(1, 2, .5, .5, .5)
dat = simData(n, pars, tt, pdfND)
head(dat)



