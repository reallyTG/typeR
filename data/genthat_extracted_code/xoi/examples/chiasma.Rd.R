library(xoi)


### Name: chiasma
### Title: Estimate chiasma distribution from crossover counts
### Aliases: chiasma
### Keywords: models

### ** Examples


data(bssbsb)

# estimated number of crossovers on chr 1
nxo <- countxo(bssbsb, chr=1)

# estimate chiasma distribution
## Not run: chiasma(nxo)
## Don't show: 
chiasma(nxo, tol=0.001)
## End(Don't show)




