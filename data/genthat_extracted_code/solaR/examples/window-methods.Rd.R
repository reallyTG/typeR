library(solaR)


### Name: D_window-methods
### Title: Methods for extracting a time window
### Aliases: window window-methods [,Meteo,ANY,ANY-method
###   [,Sol,ANY,ANY-method [,G0,ANY,ANY-method [,Gef,ANY,ANY-method
###   [,ProdGCPV,ANY,ANY-method [,ProdPVPS,ANY,ANY-method [,Meteo-method
###   [,Sol-method [,G0-method [,Gef-method [,ProdGCPV-method
###   [,ProdPVPS-method
### Keywords: methods

### ** Examples

lat=37.2
sol=calcSol(lat, BTd=fBTd(mode='serie'))
range(indexD(sol))

start <- as.Date(indexD(sol)[1])
end <- start + 30

solWindow <- sol[start, end]
range(indexD(solWindow))



