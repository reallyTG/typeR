library(Rquake)


### Name: getGAP
### Title: Get Seismic Gap
### Aliases: getGAP
### Keywords: misc

### ** Examples



set.seed(0)

N = 10
snames = paste(sep="", "A", as.character(1:N))
stas = list(name=snames, lat=runif(N, 35.9823, 36.1414), lon=runif(N, -118.0031, -117.6213))

NEQ = 3
WEQ = list(lat=runif(NEQ, 35.9823, 36.1414), lon=runif(NEQ, -118.0031, -117.6213))

 MLAT = median(stas$lat)
  MLON = median(stas$lon)
  proj = GEOmap::setPROJ(type=2, LAT0=MLAT, LON0=MLON)

  XYSTAS = GEOmap::GLOB.XY(stas$lat,  stas$lon , proj)
  eqxy = GEOmap::GLOB.XY(WEQ$lat, WEQ$lon, proj)


plot(range(c(XYSTAS$x, eqxy$x)), range(c(XYSTAS$y, eqxy$y)), type='n', asp=1, xlab="km", ylab="km" )
points(XYSTAS$x, XYSTAS$y, pch=6)

for(i in 1:NEQ)
{
EQ = list(lat=WEQ$lat[i], lon=WEQ$lon[i])


g = getGAP(EQ, stas, PLOT=FALSE)

points(eqxy$x[i], eqxy$y[i], pch=8, col='red')
text(eqxy$x[i], eqxy$y[i], labels=paste("gap=", format(g)), pos=3)

}





