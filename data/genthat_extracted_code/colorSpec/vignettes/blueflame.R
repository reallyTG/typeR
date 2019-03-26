## ----setup, echo=FALSE, results="hide"-----------------------------------
require("knitr",quietly=TRUE)
opts_chunk$set(fig.path="figs/ag2-", fig.align="center",
  fig.width=7, fig.height=7, comment="")
knit_hooks$set(output = function(x, options) {
  paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')
})
options(width=90)
if(!file.exists("figs")) dir.create("figs")

## ----packs, echo=TRUE, message=FALSE-------------------------------------
library( colorSpec )

## ----lee1, echo=TRUE, fig.pos="H", fig.height=3.8, out.width='1.0\\linewidth',  fig.cap='The spectrum of a blue flame'----
path = system.file( "extdata/sources/BlueFlame.txt", package="colorSpec" )
blueflame = readSpectra( path, seq(375,650,0.5) )
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( blueflame )

## ----lee2, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='The sum of the low and high parts is the original spectrum'----
flame.split = chop( blueflame, interval=c(432,435), adj=0.8 )
combo = bind(flame.split,blueflame)
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( combo, subset=c(T,T,F) )

## ----lee3, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='The sum of the low and high parts is the original spectrum'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( combo, subset=c(T,T,F), xlim=c(430,440) )

## ----lee4, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='The transmittance of the atmosphere, for an Air Mass of 1.5'----
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( atmosphere2003, xlim=c(375,650), ylim=c(0,1), col='black' )

## ----lee5, echo=TRUE, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='The transmittance of the atmosphere, for an Air Mass of 1.5'----
atmosphere = resample(atmosphere2003,wavelength(blueflame))
swan.atmo  = product( subset(flame.split,2), atmosphere )
specnames(swan.atmo) = "Swan bands, as viewed through the atmosphere"
combo = bind( blueflame, flame.split, swan.atmo )
specnames(combo) = c( "blue flame", 
                      "CH part of blue flame", "Swan bands, as viewed in space", 
                      "Swan bands, as viewed through the atmosphere")
par( omi=c(0,0,0,0), mai=c(0.6,0.7,0.3,0.2) )
plot( combo, xlim=c(375,650), ylim=c(0,0.7), subset=3:4 )

## ----lee6, echo=T, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='Colors as patches - computed for an sRGB display'----
mat = product( combo, BT.709.RGB, wavelength='auto' )
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( mat, norm=T )

## ----lee7, echo=T, fig.pos="H", fig.height=4, out.width='1.0\\linewidth', fig.cap='Colors as patches - computed for an Adobe RGB display'----
mat = product( combo, Adobe.RGB, wavelength='auto' )
par( omi=c(0,0,0,0), mai=c(0.2,0.2,0.2,0.2) )
plotPatchesRGB( mat, gamma=2.2, norm=T )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

