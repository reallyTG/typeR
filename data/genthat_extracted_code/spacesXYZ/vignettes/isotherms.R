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
library( spacesXYZ )

## ----fig1, echo=TRUE, message=TRUE, fig.pos="H", fig.height=5, out.width='1.0\\linewidth', fig.cap='A Comparison of 3 families of isotherms.'----
mired = seq( 0, 600, by=10 )
temp  = 1.e6/mired
uv = planckLocus( temp, param='native' )    # a spline curve
par( omi=c(0,0,0,0), mai=c(0.5,0.5,0.1,0.1) )
plot( c(0.15,0.32), c(0.245,0.37), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0), asp=1 )
title( xlab='u', line=1.5 ) ;  title( ylab='v', line=1.5 ) ; grid( lty=1 )  
lines( uv[ ,1], uv[ ,2], lwd=0.7 )
text( uv[1,1], uv[1,2], expression(infinity), adj=c(0.6,1.5), cex=1.5 )
#  draw all 3 families of isotherms
temp = c( seq(2000,10000,by=1000), 2500, 20000, 30000, Inf )
param = c('native','Robertson','McCamy') ; color = c('black','red','mediumseagreen')
for( i in 1:3 ) {
delta = 0.05 - (i-1)*0.00275
top = planckLocus( temp, param=param[i], delta=delta )
bot = planckLocus( temp, param=param[i], delta=-delta )
segments( bot[ ,1], bot[,2], top[,1], top[,2], col=color[i], lwd=1 )
if( i == 1 ) text( bot[ ,1], bot[,2], sprintf("%gK",temp), adj=c(0,1.2), cex=0.5 )
}
legend( 'bottomright', param, lwd=3, bty='n', col=color, inset=0.05 )

## ----fig2, echo=TRUE, message=TRUE, fig.pos="H", fig.height=2.5, out.width='1.0\\linewidth', fig.cap='A Comparing the Robertson and McCamy parameterizations to the native parameterization.  This comparison is only along the Planckian locus.'----
temp = sort( c( seq(2000,8000,by=100), 6667, 5714, 4444, 3636, 3333, 3077, 2857 ) )
uv = planckLocus( temp, param='native' )
diffRob = CCTfromuv( uv, isotherms='Robertson' ) - temp
diffMcC = CCTfromuv( uv, isotherms='McCamy' ) - temp
par( omi=c(0,0,0,0), mai=c(0.5,0.6,0.1,0.1) )
plot( range(temp), range(diffRob,diffMcC), type='n', las=1, tcl=0, xlab='', ylab='',
        lab=c(10,5,7), mgp=c(3,0.25,0) )
title( xlab='native temperature K', line=1.5 )
title( ylab='temperature delta K', line=1.8 )
grid( lty=1 ) ; abline( h=0 )
lines( temp, diffRob, col=color[2] )
lines( temp, diffMcC, col=color[3] )
legend = sprintf( "%s - native", param[2:3] )
legend( 'bottom', legend, lwd=3, bty='n', col=color[2:3], inset=0.05 )

## ----fig3, echo=TRUE, message=TRUE, fig.pos="H", fig.height=6, out.width='1.0\\linewidth', fig.cap='McCamy isotherms below the Planckian locus, with length 0.13.  They all intersect at the same point, which is the center of the red circle.'----
uv0 = uvfromxy( c(0.3320,0.1858), 1960 ) ; uv1 = planckLocus(6500,param='native')
rad = uv1 - uv0 ; rad = sqrt(sum(rad*rad))
par( omi=c(0,0,0,0), mai=c(0.5,0.5,0.1,0.1) )
len = 0.13
mired = seq( 0, 600, by=10 ) ; temp  = 1.e6/mired
uv = planckLocus( temp, param='native' ) 
plot( c(0.16,0.32), c(0.23,0.36), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0), asp=1 )
title( xlab='u', line=1.5 ) ;  title( ylab='v', line=1.5 ) ; grid( lty=1, lwd=0.75 )  
symbols( rep(uv0[1],2), rep(uv0[2],2), circles=c(rad,0.001), fg='red', inch=FALSE, add=T )
points( uv1[1], uv1[2], pch=20, col='red' )
lines( uv[ ,1], uv[ ,2], lwd=0.7 )  ;  points( uv[1,1], uv[1,2], pch=20, cex=0.5 )
text( uv[1,1], uv[1,2], expression(infinity), adj=c(0.6,1.6), cex=1.5 )
temp = c( seq(2000,10000,by=1000), 20000, 30000, Inf )
top = planckLocus( temp, param=param[3], delta=0 )
bot = planckLocus( temp, param=param[3], delta=-len )
segments( bot[ ,1], bot[,2], top[,1], top[,2], col=color[3], lwd=1 )
text( top[ ,1], top[,2], sprintf("%gK",temp), adj=c(1,-0.2), cex=0.5 )
legend( 'topleft', param[3], lwd=3, bty='n', col=color[3], inset=0.05 )

## ----fig4, echo=TRUE, message=TRUE, fig.pos="H", fig.height=6, out.width='1.0\\linewidth', fig.cap='Adjacent pairs of Robertson isotherms intersect below the locus. The dashed curve is the set of points at distance 0.05 from the locus.'----
mired = seq( 0, 600, by=10 )
temp  = 1.e6/mired
uv = planckLocus( temp, param='native' )    # a spline curve
par( omi=c(0,0,0,0), mai=c(0.5,0.5,0.1,0.1) )
plot( c(0.18,0.40), c(0.18,0.36), type='n', xlab='', ylab='', las=1, tcl=0,
        lab=c(10,8,7), mgp=c(3,0.25,0), asp=1 )
title( xlab='u', line=1.5 ) ;  title( ylab='v', line=1.5 ) ; grid( lty=1, lwd=0.5 )  
lines( uv[ ,1], uv[ ,2], lwd=0.7 )
text( uv[1,1], uv[1,2], expression(infinity), adj=c(0.6,1.5), cex=1.5 )
mired = c( seq(0,90,by=10), seq(100,600,by=25) )  # these are from Robertson's table
temp = 1.e6 / mired
top = planckLocus( temp, param='robertson', delta=0.1 )
bot = planckLocus( temp, param='robertson', delta=-0.05 ) ;  off = bot - top
lines( bot[ ,1], bot[ ,2], lty=2 ) ; center = matrix( 0, length(temp)-1, 2 )
for( i in 1:(length(temp)-1) )  {
    A  = cbind( off[i,], off[i+1,] ) ;    s = solve( A, top[i+1,] - top[i,] )
    center[i,] = top[i,] + s[1]*off[i, ]
    lines( c(top[i,1],center[i,1]), c(top[i,2],center[i,2]), col='red', lwd=0.5 )
    lines( c(top[i+1,1],center[i,1]), c(top[i+1,2],center[i,2]), col='red', lwd=0.5 )
}
points( center[ ,1], center[ ,2], pch=21, cex=0.5, bg='white' )

## ----finish, echo=FALSE, results="asis"----------------------------------
knit_hooks$set(output = function(x, options) { x })
toLatex(sessionInfo(), locale=FALSE)

