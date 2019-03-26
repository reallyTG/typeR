## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
options( width=100 )

## ----echo=TRUE, message=FALSE--------------------------------------------
library(munsellinterpol)
library(spacesRGB)  # for converting to RGB and plotting the patches
library(spacesXYZ)  # for CIE XYZ to Lab conversion 

## ----echo=TRUE-----------------------------------------------------------
path = system.file( 'extdata/dental.txt', package='munsellinterpol' )
dental = read.table( path, header=TRUE, sep='\t', stringsAsFactors=FALSE )
dental

## ----echo=TRUE,  fig.width=7.2, fig.height=5.2,  fig.show='hold'---------
xyY = as.matrix( dental[ c('x','y','Y') ] )
XYZ = XYZfromxyY( xyY ) / 100
# adapt from Illuminant C to the whitepoint of sRGB, which is D65
theCAT = CAT( 'C', getRGB('sRGB')$whiteXYZ )   # make the Chromatic Adaptation Transform
XYZ = adaptXYZ( theCAT, XYZ )
# create data.frame obj for plotting
obj = expand.grid( LEFT=1:6, TOP=1:4 )
obj$WIDTH = 0.9
obj$HEIGHT = 0.9
obj$RGB = RGBfromXYZ( XYZ, space='sRGB' )$RGB     # convert to sRGB
rownames(obj) = rownames(dental)
# plot as square patches
par( omi=c(0,0,0,0), mai=c(0.1,0.1,0.1,0.1) )
plotPatchesRGB( obj, which='signal', labels="bottomleft", adj=c(-0.2,-0.5), cex=0.7 )

## ----echo=TRUE-----------------------------------------------------------
Lab  = as.matrix( dental[ c('L','a','b') ] )
XYZ = XYZfromxyY( xyY )
Lab2 = LabfromXYZ( XYZ/100, 'C' )     # recompute Lab
HVC  = HVCfromMunsellName( dental$Munsell )
HVC2 = XYZtoMunsell( XYZ )            # recompute Munsell HVC
comp = data.frame( row.names=rownames(dental) )
comp$Y  = dental$Y
comp$L  = Lab[ ,1]
comp$L2 = round(Lab2[ ,1],4)
comp$Ldiff = round( comp$L - comp$L2, 4 )
comp$DeltaE = round( DeltaE( Lab, Lab2 ), 4 )   # DeltaE is the pairwise color difference
comp$Munsell = dental$Munsell
comp$Munsell2 = MunsellNameFromHVC( HVC2, format='f', digits=2 )
comp$NickersonCD = round( NickersonColorDifference( HVC, HVC2 ), 4 )
comp

## ----echo=TRUE-----------------------------------------------------------
HVC3 = HVC2
HVC3[ ,2] = VfromY( dental$Y, which='MgO' )
comp$Munsell2 = NULL
comp$NickersonCD = NULL
comp$Munsell3 = MunsellNameFromHVC( HVC3, format='f', digits=2 )
comp$NickersonCD = round( NickersonColorDifference( HVC, HVC3 ), 4 )
comp

## ----echo=TRUE-----------------------------------------------------------
obj = data.frame( row.names=rownames(dental) )
obj$Munsell2 = MunsellNameFromHVC( HVC2, format='f', digits=2 )
block = ColorBlockFromMunsell( HVC2 )
obj[[ "ISCC-NBS Name" ]] = block$Name
obj

## ---- echo=FALSE, results='asis'-----------------------------------------
sessionInfo()

