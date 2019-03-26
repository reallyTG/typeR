library(ParetoPosStable)


### Name: PPS
### Title: The Pareto Positive Stable (PPS) distribution
### Aliases: PPS dPPS hPPS pPPS qPPS rPPS

### ** Examples

print(x <- sort(rPPS(10, 1.2, 100, 2.3)))
dPPS(x, 1.2, 100, 2.3)
pPPS(x, 1.2, 100, 2.3)
qPPS(pPPS(x, 1.2, 100, 2.3), 1.2, 100, 2.3)
hPPS(x, 1.2, 100, 2.3)



