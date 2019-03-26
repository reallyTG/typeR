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
source( "optimal-help.R" )

## ----lee10, echo=TRUE, message=FALSE-------------------------------------
A.eye = product( A.1nm, "VARMATERIAL", xyz1931.1nm, wavelength='auto' )

## ----lee11, echo=TRUE, message=FALSE-------------------------------------
A.data = computeOptimals( A.eye, .angles=360 )

## ----lee12, echo=TRUE, fig.pos="H", fig.height=6.5, out.width='1.0\\linewidth', fig.cap='MacAdam Limits for Illuminant A'----
par( omi=rep(0,4), mai=c(0.5,0.6,0,0) )
plotOptimals( A.eye, A.data )

## ----lee20, echo=TRUE, message=FALSE-------------------------------------
D65.eye = product( D65.1nm, "VARMATERIAL", xyz1931.1nm, wavelength='auto' )

## ----lee21, echo=TRUE, message=FALSE-------------------------------------
D65.data = computeOptimals( D65.eye, .angles=360 )

## ----lee22, echo=TRUE, fig.pos="H", fig.height=6.5, out.width='1.0\\linewidth', fig.cap='MacAdam Limits for Illuminant D65'----
par( omi=rep(0,4), mai=c(0.5,0.6,0,0) )
plotOptimals( D65.eye, D65.data )

## ----lee40, echo=TRUE, message=FALSE-------------------------------------
C.eye = product( C.5nm, "VARMATERIAL", xyz1931.1nm, wavelength='auto' )

## ----lee41, echo=TRUE, message=FALSE-------------------------------------
C.data = computeOptimals( C.eye, .angles=360 )

## ----lee42, echo=TRUE, fig.pos="H", fig.height=6.5, out.width='1.0\\linewidth', fig.cap='MacAdam Limits for Illuminant C'----
par( omi=rep(0,4), mai=c(0.5,0.6,0,0) )
plotOptimals( C.eye, C.data )

## ----lee30, echo=TRUE, message=FALSE-------------------------------------
Flea2.scanner = product( A.1nm, "VARMATERIAL", Flea2.RGB, wavelength=420:680 )

## ----lee31, echo=TRUE, message=FALSE-------------------------------------
Flea2.data = computeOptimals( Flea2.scanner, .angles=360 )

## ----lee32, echo=TRUE, fig.pos="H", fig.height=6.5, out.width='1.0\\linewidth', fig.cap='Approximate Output Limits for an RGB scanner'----
par( omi=rep(0,4), mai=c(0.5,0.6,0,0) )
plotOptimals( Flea2.scanner, Flea2.data )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

