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

## ----cameras, echo=TRUE, message=FALSE, fig.height=3.9, out.width='1.0\\linewidth', fig.cap='Reference camera BT.709.RGB (solid)  vs  Foveon X3 camera (dashed)'----
wave = 380:720
# read the Macbeth ColorCheck target
path = system.file( 'extdata/cameras/FoveonX3.txt', package='colorSpec') 
foveon = radiometric( readSpectra( path, wave=wave ) )
reference = resample( BT.709.RGB, wave=wave )
# calibrate so that both have the same response RGB=(1,1,1) to Illuminant E
illum = illuminantE(wave=wave)
foveon = calibrate( foveon, stimulus=illum )
reference = calibrate( reference, stimulus=illum )
# plot both for comparison
par( omi=c(0,0,0,0), mai=c(0.5,0.9,0.1,0) )
plot( reference, main='' )
plot( foveon, lty=2, add=TRUE, legend=FALSE, color=c('red','green','blue') )

## ----target, echo=TRUE, message=FALSE------------------------------------
# read the Macbeth ColorCheck target
path = system.file( 'extdata/targets/CC_Avg30_spectrum_CGATS.txt', package='colorSpec') 
MacbethCC = readSpectra( path, wave=wave )  # MacbethCC is a 'colorSpec' object
MacbethCC = MacbethCC[ order(MacbethCC$SAMPLE_ID), ]  # still class 'colorSpec'
print( extradata(MacbethCC), row.names=F )

## ----lee11, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant E, with Foveon RGB in bottom right half'----
RGB.ref = product( illum, MacbethCC, reference)   # this is *linear* sRGB
# add the rectangle data to RGB.ref, so the patches are plotted in proper places
df.ref = extradata(MacbethCC)
df.ref$RGB.ref = RGB.ref
#  display in proper location, and use the sRGB display transfer function
par( omi=c(0,0,0,0), mai=c(0,0,0,0) )
plotPatchesRGB( df.ref, gamma='sRGB', back='gray20', labels=FALSE )
# repeat with foveon camera, and add to existing plot
RGB.foveon = product( illum, MacbethCC, foveon )
df.foveon = extradata(MacbethCC)
df.foveon$RGB.foveon = RGB.foveon
plotPatchesRGB( df.foveon, gamma='sRGB', shape='bottomright', add=T, labels=FALSE )

## ----lee12, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='Reference camera (solid)  vs  the modified Foveon camera (dashed)'----
foveon.mod = emulate( foveon, reference, filter=TRUE, matrix=TRUE ) 
par( omi=c(0,0,0,0), mai=c(0.5,0.9,0.2,0) )
plot( reference, main='' )
plot( foveon.mod, lty=2, add=TRUE, legend=FALSE )

## ----lee15, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant E, with modified Foveon RGB in bottom right half'----
par( omi=c(0,0,0,0), mai=c(0,0,0,0) )
plotPatchesRGB( df.ref, gamma='sRGB', back='gray20', labels=FALSE )
# repeat with modified foveon camera, and add to existing plot
df.foveon.mod = extradata(MacbethCC)
df.foveon.mod$RGB.foveon.mod  = product( illum, MacbethCC, foveon.mod )
plotPatchesRGB( df.foveon.mod, gamma='sRGB', shape='bottomright', add=T, labels=FALSE )

## ----lee16, echo=TRUE, fig.pos="H", fig.height=3.5, out.width='1.0\\linewidth', fig.cap='Prefilter for the modified Foveon camera'----
attr(foveon.mod,"emulate")$A
par( omi=c(0,0,0,0), mai=c(0.5,0.9,0.2,0) )
prefilter = attr(foveon.mod,"emulate")$filter
specnames(prefilter) = "prefilter for modified Foveon"
plot( prefilter,  main='', ylim=c(0,1.1) )

## ----lee17, echo=TRUE, message=FALSE-------------------------------------
A = attr(foveon.mod,"emulate")$A   # A is the 3x3 matrix already printed above
kappa( A, exact=TRUE, norm='2' )   # kappa() returns the condition number of A

## ----cameras2, echo=TRUE, message=FALSE, fig.height=3.9, out.width='1.0\\linewidth', fig.cap='plumbicon  (solid)  vs  Dragon (dashed)'----
wave = 400:700
# read the 2 cameras
path = system.file( 'extdata/cameras/Plumbicon30mm.txt', package='colorSpec') 
plumbicon =  readSpectra( path, wave=wave )
path = system.file( 'extdata/cameras/Red-Epic-Dragon.txt', package='colorSpec') 
dragon = readSpectra( path, wave=wave )
# calibrate to normalize the response to Illuminant E
illum = illuminantE(wave=wave)
plumbicon = calibrate( plumbicon, stimulus=illum )
dragon = calibrate( dragon, stimulus=illum )
# plot both for comparison
par( omi=c(0,0,0,0), mai=c(0.5,0.9,0.1,0) )
plot( dragon, main='', lty=2, legend=FALSE )
plot( plumbicon, col='black', lty=1, add=TRUE, legend='topleft'  )

## ----lee22, echo=TRUE, fig.pos="H", fig.height=3.9, out.width='1.0\\linewidth', fig.cap='Plumbicon camera (solid)  vs  the modified Dragon camera (dashed)'----
dragon.mod = emulate( dragon, plumbicon, filter=FALSE, matrix=TRUE ) 
specnames( dragon.mod ) = "Dragon, matrixed"
combo = bind( plumbicon, dragon.mod )
par( omi=c(0,0,0,0), mai=c(0.5,0.9,0.2,0) )
plot( combo, main='', lty=c(1,2), col='black' )

## ----weights, echo=TRUE, message=FALSE-----------------------------------
t( attr(dragon.mod,"emulate")$A )

## ----lee31, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Rendering with Illuminant E, with matrixed Dragon in bottom right half'----
MacbethCC = resample(MacbethCC,wave=wave)
graylevel = product( illum, MacbethCC, plumbicon)
RGB.plumbicon = matrix( graylevel, length(graylevel), 3 )
df.plumbicon = extradata(MacbethCC)
df.plumbicon$RGB = RGB.plumbicon
par( omi=c(0,0,0,0), mai=c(0,0,0,0) )
plotPatchesRGB( df.plumbicon, back='black', labels=FALSE )
# repeat with dragon.mod camera, and add to existing plot, as triangles
graylevel = product( illum, MacbethCC, dragon.mod)
df.dragon = extradata(MacbethCC)
df.dragon$RGB = matrix( graylevel, length(graylevel), 3 )
plotPatchesRGB( df.dragon, back='black', labels=FALSE, add=T, shape='bottomright' )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

