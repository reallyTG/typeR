## ---- echo=TRUE, message=FALSE-------------------------------------------
library( colorSpec )

## ----fig.width=7, fig.height=4,  fig.show='hold', dev='png'--------------
path = system.file( "extdata/stains/PhenolRed-Fig7.txt", package="colorSpec" )
wave = 350:650
phenolred = readSpectra( path, wavelength=wave )
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.4,0.2) )
plot( phenolred, main='Absorbance Spectra of Phenol Red at Different pH Values' )

## ---- echo=TRUE, message=TRUE, fig.width=7, fig.height=5,  fig.show='hold' , dev='png'----
wavesel = c( 365, 430, 477, 520, 560, 590 )  # 365 and 477 are 'isosbestic points'
mat = apply( as.matrix(wavesel), 1, function( lambda ) { as.numeric(lambda == wave) } )
colnames( mat ) = sprintf( "%g nm", wavesel )
mono = colorSpec( mat, wavelength=wave, quantity='power' )
RGB = product( mono, BT.709.RGB, wavelength=wave )
colvec = grDevices::rgb( DisplayRGBfromLinearRGB( RGB / max(RGB) ) )

phenolsel = resample( phenolred, wavesel )
pH = as.numeric( sub( '[^0-9]*([0-9]+)$', '\\1', specnames(phenolred) ) )
pHvec = seq(min(pH),max(pH),by=0.05)
phenolsel = interpolate( phenolsel, pH, pHvec )
mat = t( as.matrix( phenolsel ) )
par( omi=c(0,0,0,0), mai=c(0.8,0.9,0.6,0.4) )
plot( range(pH), range(mat), las=1, xlab='pH', ylab='absorbance', type='n' )
grid( lty=1 ) ; abline( h=0 )
matlines( pHvec, mat, lwd=3, col=colvec, lty=1 )
title( "Absorbance of Phenol Red at Selected Wavelengths")
legend( 'topleft', specnames(mono), col=colvec, lty=1, lwd=3, bty='n' )

## ---- echo=TRUE,  message=TRUE, results='hold', fig.width=7, fig.height=4,  fig.show='hold'----
pHvec = seq(6.8,8.2,by=0.2)
phenolpool = interpolate( phenolred, pH, pHvec )
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.4,0.2) )
plot( phenolpool, main="Absorbance Spectra of Phenol Red at Swimming Pool pH Values" )

## ---- echo=TRUE,  message=TRUE-------------------------------------------
# create an uncalibrated 'material responder'
testkit = product( D65.1nm, 'solution', BT.709.RGB, wave=wave )
# now calibrate so that fully transparent pure water has response RGB=c(1,1,1)
testkit = calibrate( testkit, response=1 )
RGB = product( phenolpool, testkit )
RGB

## ---- echo=TRUE,  message=TRUE-------------------------------------------
testkit = product( D65.1nm, 'solution', BT.709.RGB, wave=wave )
# recalibrate, but lower the background a little, to allow more 'headroom' for indicator colors
bglin = 0.96  #  graylevel for the background, linear
testkit = calibrate( testkit, response=bglin )
RGB = product( phenolpool, testkit )
RGB

## ---- echo=TRUE, fig.width=7, fig.height=2.5,  fig.show='hold'-----------
df.RGB = data.frame( LEFT=1:nrow(RGB), TOP=0, WIDTH=1, HEIGHT=2 )
df.RGB$RGB = RGB
par( omi=c(0,0,0,0), mai=c(0.3,0,0.3,0) )
plotPatchesRGB( df.RGB, labels=F, background=bglin )
text( (1:nrow(RGB)) + 0.5, 2, sprintf("%.1f",pHvec), adj=c(0.5,1.2), xpd=NA )
title( main='Calculated Colors for pH from 6.8 to 8.2' )

## ---- echo=TRUE, fig.width=7, fig.height=2.5,  fig.show='hold'-----------
tweak = 1.2
phenolpool = multiply( phenolpool, tweak )
df.RGB = data.frame( LEFT=1:nrow(RGB), TOP=0, WIDTH=1, HEIGHT=2 )
df.RGB$RGB = product( phenolpool, testkit )
par( omi=c(0,0,0,0), mai=c(0.3,0,0.3,0) )
plotPatchesRGB( df.RGB, background=bglin, labels=F )
text( (1:nrow(RGB)) + 0.5, 2, sprintf("%.1f",pHvec), adj=c(0.5,1.2), xpd=NA )
main = sprintf( 'Calculated Colors for pH from 6.8 to 8.2 (absorbance multiplier=%g)', tweak )
title( main=main )

## ---- echo=FALSE, results='asis'-----------------------------------------
sessionInfo()

