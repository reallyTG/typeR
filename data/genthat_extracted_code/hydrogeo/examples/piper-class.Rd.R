library(hydrogeo)


### Name: piper-class
### Title: Class 'piper'
### Aliases: piper-class initialize,piper-method labelAxes,piperplot-method
###   plot,piper-method show,piper-method
### Keywords: classes

### ** Examples

showClass("piper")

l <- list( Ca = c(43,10,73,26,32),
           Mg = c(30,50,3,14,12),
           Cl = c(24,10,12,30,43),
           SO4 = c(24,10,12,30,43))

lp <- piper(l)
plot( lp, main="Piper-Hill Diagram of Water Quality" )

# change symbols and colours to differentiate water type groups
lp@pt.pch = c(2,2,4,4,4)
lp@pt.col = c(0,1,0,1,2)

# use larger symbols
plot( lp, main="Piper-Hill Diagram of Water Quality", cex=1.4 )



