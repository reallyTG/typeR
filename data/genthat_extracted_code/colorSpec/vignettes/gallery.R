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

## ----target, echo=TRUE, message=FALSE------------------------------------
# read the Macbeth ColorCheck target
path = system.file( 'extdata/targets/CC_Avg30_spectrum_CGATS.txt', package='colorSpec') 
MacbethCC = readSpectra( path )           # MacbethCC is a 'colorSpec' object
MacbethCC = MacbethCC[ order(MacbethCC$SAMPLE_ID), ]  # still class 'colorSpec'
print( extradata(MacbethCC), row.names=F )

## ----lee10, echo=TRUE, message=FALSE-------------------------------------
D65.eye = product( D65.1nm, "artwork", xyz1931.1nm, wave='auto' )
#   calibrate so the perfect-reflecting-diffuser is the 'official XYZ'
#   scale XYZ independently
PRD = neutralMaterial( 1, wavelength(D65.eye) )
D65.eye = calibrate( D65.eye, stimulus=PRD, response=officialXYZ('D65'), method='scaling' )

## ----lee11, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D65 and xyz1931.1nm'----
XYZ = product( MacbethCC, D65.eye, wave='auto' )
RGB = RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
# add the rectangle data to RGB, so they can be plotted in proper places
obj = extradata(MacbethCC)
obj$RGB = RGB
#  display in proper location, and use the sRGB display transfer function
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj, gamma='sRGB', back='gray20', labels=FALSE )
obj.first = obj   # save this reference object for later

## ----lee13, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='8-bit Device Values'----
RGB8 = round( 255 * DisplayRGBfromLinearRGB( RGB, gamma='sRGB' ) )
print( RGB8 )

## ----lee12, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D65 and Theoretical BT.709.RGB Camera'----
RGB = product( D65.1nm, MacbethCC, BT.709.RGB, wave='auto' )    # this is *linear* sRGB
obj = extradata(MacbethCC)
obj$RGB = RGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee20, echo=TRUE, message=FALSE-------------------------------------
D50.eye = product( D50.5nm, "artwork", xyz1931.5nm, wave='auto' )
#   calibrate so the response to the perfect-reflecting-diffuser is the 'official XYZ' of D50
#   scale XYZ independently
PRD = neutralMaterial( 1, wavelength(D50.eye) )
D50.eye = calibrate( D50.eye, stimulus=PRD, response=officialXYZ('D50'), method='scaling' )

## ----lee21, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D50 and xyz1931.5nm'----
XYZ = product( MacbethCC, D50.eye, wave='auto' )
obj = extradata(MacbethCC)
obj$RGB =  RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee22, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant D50 and xyz1931.5nm, but then adapted to D65'----
D50.eye = product( D50.5nm, "artwork", xyz1931.5nm, wave='auto' )
#  calibrate so the response to the perfect-reflecting-diffuser is the 'official XYZ' of D65
#  with this chromatic adaption the destination XYZ is a 3x3 matrix times the source XYZ
PRD = neutralMaterial( 1, wavelength(D50.eye) )
XYZ.D65 = officialXYZ('D65')
D50toD65.eye = calibrate( D50.eye, stimulus=PRD, response=XYZ.D65, method='Bradford' )
XYZ = product( MacbethCC, D50toD65.eye, wave='auto' )
obj = extradata(MacbethCC)
obj$RGB = RGBfromXYZ( XYZ, 'sRGB' )       # this is *linear* sRGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj, gamma='sRGB', back='gray20', labels=FALSE )

## ----lee23, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with both D65 (Figure 1), and D50 then adapted to D65 (Figure 4)'----
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj.first, gamma='sRGB', back='gray20', labels=F )
plotPatchesRGB( obj, gamma='sRGB', labels=F, shape='bottomright', add=T )

## ----lee30, echo=TRUE,  fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with a generic  RGB scanner'----
#   Build a scanner from Illuminant F11 and the Flea2 camera
scanner = product( subset(Fs.5nm,'F11'), 'artwork', Flea2.RGB, wave='auto' )
#   calibrate scanner so the response to the perfect-reflecting-diffuser is RGB=(1,1,1)
#   set the RGB gains independently
PRD = neutralMaterial( 1, wavelength(scanner) )
scanner = calibrate( scanner, stimulus=PRD, response=1, method='scaling' )
obj = extradata(MacbethCC)
obj$RGB = product( MacbethCC, scanner, wave='auto' )       # this RGB is not sRGB
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( obj, gamma='sRGB', back='gray20', labels=FALSE )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

