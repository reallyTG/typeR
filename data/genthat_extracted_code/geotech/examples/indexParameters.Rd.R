library(geotech)


### Name: indexParameters
### Title: Phase Diagrams and Index Parameters
### Aliases: indexParameters phase.plot phase.params waterContent
###   relDensity

### ** Examples


##  Example of phase diagram plot:
phase.plot(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25,
           Va = 0.1, W.unit = "lb", V.unit = "ft^3", mass = FALSE)

##  Example of index parameters function:
phase.params(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25, Va = 0.1)

##  Example of water content function:
waterContent(M1 = 20.68, M2 = 18.14, Mc = 8.20)

##  Example of relative density function:
relDensity(e = 0.3, emax = 0.92, emin = 0.35)




