## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
options( width=100 )
library(munsellinterpol)

## ----echo=TRUE-----------------------------------------------------------
MunsellToxyY( '4.2RP 5.5/8' )

## ----echo=TRUE-----------------------------------------------------------
xyY = MunsellToxyY( '4.2RP 5.5/8' )$xyY
xyYtoMunsell( xyY )

## ---- echo=TRUE,  message=TRUE, results='hold', fig.width=7, fig.height=6,  fig.show='hold'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.4,0.2) )
plotPatchesH( "10GY", back='#f7f7f7' )

## ---- echo=TRUE,  message=TRUE, results='hold', fig.width=7, fig.height=6,  fig.show='hold'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.4,0.2) )
plotPatchesH( "10GY", space='AdobeRGB', back='#f7f7f7' )

## ---- echo=TRUE,  message=TRUE, results='hold', fig.width=7, fig.height=6,  fig.show='hold'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.6,0.2) )
plotLociHC( value=8 )

## ---- echo=TRUE,  message=TRUE, results='hold', fig.width=7, fig.height=6,  fig.show='hold'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.6,0.2) )
plotLociHC( value=8, coords='ab' )

## ----echo=TRUE-----------------------------------------------------------
path = system.file( 'extdata/PantoneCoY.txt', package='munsellinterpol' )
pantone = read.table( path, header=TRUE, sep='\t', strings=FALSE )
pantone

## ----echo=TRUE-----------------------------------------------------------
pantone$Year = NULL ;   pantone$Code = NULL
RGB = as.matrix( pantone[ , c('R','G','B') ] )
HVC = RGBtoMunsell( RGB, space='sRGB' )
pantone$Munsell = MunsellNameFromHVC( HVC )
block = ColorBlockFromMunsell( HVC )
pantone[[ "ISCC-NBS Name" ]] = block$Name
pantone[[ "ISCC-NBS Centroid" ]] = block$Centroid
pantone

## ----echo=TRUE-----------------------------------------------------------
color.pant = rgb( RGB, max=255 )
color.cent = rgb( MunsellToRGB( block$Centroid, space='sRGB' )$RGB, max=255 )
tbl = data.frame( row.names=1:nrow(pantone) )
tbl[[ "Pantone Name" ]]  = pantone$Name
tbl[[ "Pantone Color" ]] = '' ;    tbl[[ "Centroid Color" ]] = ''
tbl[[ "ISCC-NBS Name" ]] = block$Name
library( flextable )
myrt <- regulartable( tbl )
myrt <- align( myrt, j=4, align='left', part='all' )
myrt <- align( myrt, j=2:3, align='center', part='all' )
myrt <- height( myrt, height=1 )
myrt <- width( myrt, j=c(1,4), width=2 ) ; myrt <- width( myrt, j=2:3, width=2.5 )
myrt <- fontsize( myrt, size=14, part='all' ) ; myrt <- fontsize( myrt, size=16, part='header' )
for( i in 1:nrow(tbl) )
{ myrt <- bg(myrt, i=i, j=2, bg=color.pant[i]) ; myrt <- bg(myrt, i=i, j=3, bg=color.cent[i]) }
myrt

## ---- echo=FALSE, results='asis'-----------------------------------------
sessionInfo()

