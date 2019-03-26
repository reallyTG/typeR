library(evir)


### Name: interpret.gpdbiv
### Title: Interpret Results of Bivariate GPD Fit
### Aliases: interpret.gpdbiv
### Keywords: htest

### ** Examples

data(bmw) ; data(siemens)
out <- gpdbiv(-bmw, -siemens, ne1 = 100, ne2 = 100) 
interpret.gpdbiv(out, 0.05, 0.05) 
# probabilities of 5% falls in BMW and Siemens stock prices 



