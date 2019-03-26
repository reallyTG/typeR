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

## ----lee11, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Value V  vs.  Luminance Factor Y'----
par( omi=c(0,0,0,0), mai=c(0.5,0.5,0.1,0.1) )
plot( c(0,100), c(0,10), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0) )
title( xlab='Y', line=1.5 ) ;  title( ylab='Value', line=1.5 )
grid( lty=1 ) ;  abline( h=0, v=0 )
V = seq( 0, 10, by=0.125 )
color = unlist( list(ASTM='black',OSA='black',MgO='black',Munsell='red',Priest='blue') )
for( w in names(color) )
    lines( YfromV(V,w), V, col=color[w], lty=ifelse(w=='MgO',2,1), lwd=0.75 )
lty = ifelse( names(color)=='MgO', 2, 1 )
legend( "bottomright", names(color), bty='n', lty=lty, lwd=1.5, col=color, inset=0.1 )

## ----lee12, echo=TRUE, fig.pos="H", fig.height=3.5, out.width='1.0\\linewidth', fig.cap='The Difference between ASTM and OSA Definitions of Value'----
par( omi=c(0,0,0,0), mai=c(0.5,1,0.1,0.1) )
Y = seq( 0, 100, by=0.5 )
delta = VfromY(Y,'OSA') - VfromY(Y,'ASTM')
plot( range(Y), range(delta), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0) )
title( xlab='Y', line=1.5 ) ;  title( ylab='{OSA Value} - {ASTM Value}', line=3 )
grid( lty=1 ) ;  abline( h=0, v=0 )
lines( Y, delta, lwd=0.75 )

## ----Lightness, echo=TRUE, message=FALSE---------------------------------

Lightness_from_linear  <-  function( Y )  {
ifelse( Y < (24/116)^3, (116/12)^3 * Y, 116*Y^(1/3) - 16 )
}

## ----lee13, echo=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='Comparing Lightness and Munsell Value'----
par( omi=c(0,0,0,0), mai=c(0.5,0.75,0.1,0.1) )
Y = (0:100)/100
L = Lightness_from_linear( Y )
plot( range(Y), range(L), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0) )
title( xlab='Y   (luminance factor)', line=1.5 ); title( ylab='Lightness', line=2 )
grid( lty=1 ) ;  abline( h=0, v=0 )
lines( Y, L, lwd=0.75 )
V = VfromY( 100 * Y, 'ASTM' )
lines( Y, 10*V, lty=2 )
legend(  "bottomright", c("Lightness (CIE)","10*Value (ASTM)"), lty=c(1,2),
            bty='n', inset=0.1 )

## ----lee14, echo=TRUE, fig.pos="H", fig.height=3, out.width='1.0\\linewidth', fig.cap='Comparing Lightness and Munsell Value'----
par( omi=c(0,0,0,0), mai=c(0.5,0.75,0.1,0.1) )
quotient = L / V
plot( range(Y), range(quotient,na.rm=T), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0) )
title( xlab='Y   (luminance factor)', line=1.5 )
title( ylab='Lightness / Value', line=3 )
grid( lty=1 ) ;  abline( h=0, v=0 )
lines( Y, quotient )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

