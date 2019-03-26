## ---- echo=TRUE, message=FALSE-------------------------------------------
library( colorSpec )

## ----echo=TRUE, fig.cap='Figure 1.  Energy Spectrum of a Domestic LED Bulb, manufactured by Cree', fig.align="center", fig.width=7, fig.height=4, dev='png'----
wave = 275:899
path = system.file( "extdata/sources/Cree-LED.txt", package="colorSpec" )
bulb = readSpectra( path, wavelength=wave )
par( omi=c(0,0,0,0), mai=c(0.6,0.8,0.1,0.1) )
plot( bulb, main='' )

## ---- echo=TRUE, message=FALSE-------------------------------------------
luminous.flux = photometric( bulb ) ; luminous.flux

## ---- echo=TRUE, message=FALSE-------------------------------------------
bulb = multiply( bulb, 75/luminous.flux[1] ) ; bulb
#   check that the luminous flux is now 75 lumens
photometric( bulb )

## ----fig.cap='Figure 2.  Energy Spectrum of a Domestic LED Bulb, manufactured by Cree', fig.align="center", dev='png', fig.width=7, fig.height=4,  fig.show='hold', message=FALSE----
par( omi=c(0,0,0,0), mai=c(0.6,0.95,0.1,0.1) )
ylab = expression( 'Radiant Power'  ~~~  '[watt * ' ~ nm^-1 ~ ']' )
plot( bulb, main='', ylab=ylab )

## ----fig.cap='Figure 3.  Photon Flux of a Domestic LED Bulb, manufactured by Cree', fig.align="center", dev='png', fig.width=7, fig.height=4,  fig.show='hold', message=FALSE----
bulb = actinometric( bulb )
par( omi=c(0,0,0,0), mai=c(0.6,0.9,0.1,0.1) )
ylab = expression( 'Photon Flux'  ~~~  '[' ~ mu ~ 'mole * ' ~ sec^-1 ~ nm^-1 ~ ']'  )
plot( bulb, main='', ylab=ylab )

## ---- echo=TRUE, message=FALSE-------------------------------------------
bulb

## ---- echo=FALSE, results='asis'-----------------------------------------
sessionInfo()

