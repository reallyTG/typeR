library(httk)


### Name: calc_mc_css
### Title: Find the monte carlo steady state concentration.
### Aliases: calc_mc_css
### Keywords: Monte Carlo Steady State

### ** Examples

## Not run: 
##D  calc_mc_css(chem.name='Bisphenol A',output.units='uM',method='vi',
##D              samples=100,return.samples=TRUE)
##D  calc_mc_css(chem.name='2,4-d',which.quantile=.9,httkpop=FALSE,tissue='heart')
##D 
##D calc_mc_css(chem.cas = "80-05-7", daily.dose = 1, which.quantile = 0.5,
##D censored.params = list(Funbound.plasma = list(cv = 0.1, lod = 0.005)),
##D vary.params = list(BW = 0.15, Vliverc = 0.15, Qgfrc = 0.15,
##D Qtotal.liverc = 0.15, million.cells.per.gliver = 0.15, Clint = 0.15),
##D output.units = "uM", samples = 2000)
##D 
## End(Not run)



