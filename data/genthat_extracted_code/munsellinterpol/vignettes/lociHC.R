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
library( munsellinterpol )

## ----lee11, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Loci of Constant Hue and Chroma for Value 8/'----
par( omi=c(0,0,0,0), mai=c(0.41,0.7,0.6,0.2) )
plotLociHC( value=8 )

## ----lee12, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Loci of Constant Hue and Chroma for Value 8/'----
par( omi=c(0,0,0,0), mai=c(0.41,0.7,0.6,0.2) )
plotLociHC( value=8, hue=seq(5,55,by=2.5), chroma=seq(2,34,by=2) )

## ----lee13, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Loci of Constant Hue and Chroma for Value 0.4/'----
par( omi=c(0,0,0,0), mai=c(0.41,0.7,0.6,0.2) )
plotLociHC( value=0.4, hue=seq(80,90,by=2.5), chroma=seq(2,12,by=2) )

## ----lee14, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Loci of Constant Hue and Chroma for Value 8/, with bilinear interpolation'----
par( omi=c(0,0,0,0), mai=c(0.41,0.7,0.6,0.2) )
plotLociHC( value=8, hcinterp='bilinear' )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

