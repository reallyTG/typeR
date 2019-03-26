## ----setup, echo=FALSE, results="hide"-----------------------------------
require("knitr",quietly=TRUE)
opts_chunk$set(fig.path="figs/ag2-", fig.align="center",
  fig.width=7, fig.height=7, comment="")
knit_hooks$set(output = function(x, options) {
  paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')
})
options(width=90)
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
if(!file.exists("figs")) dir.create("figs")

## ----packs, echo=TRUE, message=FALSE-------------------------------------
library( colorSpec )

## ----lens1, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='Human Lens Transmittance at age=32 and age=64'----
lens.trans = linearize( lensAbsorbance( c(32,64), wave=380:780 ) )   
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( lens.trans, color='black', lty=1:2, main=FALSE, legend='topleft' )

## ----lens2, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='Human Lens Transmittance at age 64 relative to age 32'----
lens.64 = lens.trans[ ,2] / lens.trans[ ,1]
lens.64 = colorSpec( lens.64, wavelength(lens.trans), 'transmittance' )
specnames(lens.64) = "trans.64 / trans.32"
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( lens.64, main=TRUE, legend=FALSE, ylab='Relative Transmittance', col='black' )

## ----target, echo=TRUE, message=FALSE------------------------------------
path = system.file( 'extdata/targets/CC_Avg30_spectrum_CGATS.txt', package='colorSpec') 
MacbethCC = readSpectra( path, wave=wavelength(lens.64) ) 
MacbethCC = MacbethCC[ order(MacbethCC$SAMPLE_ID), ]
print( extradata(MacbethCC), row.names=F )

## ----lee10, echo=TRUE, message=FALSE-------------------------------------
D65.eye = product( D65.1nm, "artwork", xyz1931.1nm, wave=wavelength(lens.64) )
#   calibrate so the perfect-reflecting-diffuser is the 'official XYZ'
#   scale XYZ independently
prd = neutralMaterial( 1, wavelength(lens.64) )
D65.eye = calibrate( D65.eye, stimulus=prd, response=officialXYZ('D65'), method='scaling' )

## ----lee11, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D65 and xyz1931.1nm, at age=32'----
XYZ = product( MacbethCC, D65.eye, wave=wavelength(lens.64) )
RGB = RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
# add the rectangle data to RGB, so they can be plotted in proper places
patches = extradata(MacbethCC)
patches$RGB = RGB
patches.first = patches   # save this reference object for later
#  display in proper location, and use the sRGB display transfer function
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( patches, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee20, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D65 and xyz1931.1nm, at age=64 without adaption'----
D65.eye.64 = applyspec( D65.eye, function(y) {lens.64 * y} )
XYZ = product( MacbethCC, D65.eye.64, wave=wavelength(lens.64) )
patches = extradata(MacbethCC)
patches$RGB = RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( patches, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee21, echo=TRUE,  fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='comparison of effective responsivities, at age=32 and age=64'----
#   the effective responsivities for age=32
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
specnames( D65.eye ) = sprintf( "%s.32", c('x','y','z') )
plot( D65.eye,  lty=1, legend='top' )
#   the effective responsivities for age=64
specnames( D65.eye.64 ) = sprintf( "%s.64", c('x','y','z') )
plot( D65.eye.64,  lty=2, add=TRUE, legend='topright' )

## ----lee22, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D65 and xyz1931.1nm, at age=64 after chromatic adaption'----
prd = neutralMaterial( 1, wavelength(lens.64) )
XYZ.D65 = officialXYZ('D65')
D65.eye.64 = calibrate( D65.eye.64, stimulus=prd, response=XYZ.D65, method='Bradford' )
XYZ = product( MacbethCC, D65.eye.64, wave=wavelength(lens.64) )
patches = extradata(MacbethCC)
patches$RGB = RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( patches, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee23, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with both age=32 (Figure 3), and age=64 (Figure 6)'----
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
#  draw full squares from Figure 3
plotPatchesRGB( patches.first, gamma='sRGB', back='gray20', labels=F )
#  overwrite the squares with triangles by setting shape= and add=
plotPatchesRGB( patches, gamma='sRGB', labels=F, shape='bottomright', add=T )

## ----lee30, echo=TRUE,  fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='comparison of effective responsivities'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( D65.eye,  lty=1, legend='top', main=FALSE )
plot( D65.eye.64, lty=2, add=TRUE, legend='topright' )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

