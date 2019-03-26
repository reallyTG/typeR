library(hqmisc)


### Name: bracket
### Title: Add rectangular bracket to plot
### Aliases: bracket
### Keywords: file

### ** Examples

plot( 1:9, 1:9 )
bracket( x0=4, x1=6, y0=3, side=1 )
bracket( x0=3, y0=4, y1=6, side=2, offset=1, length=1, lty=2 )
bracket( x0=4, x1=6, y0=7, side=3, col="red" )
# negative length: whiskers outside
bracket( x0=7, y0=4, y1=6, side=4, offset=0, length=-1 ) 



