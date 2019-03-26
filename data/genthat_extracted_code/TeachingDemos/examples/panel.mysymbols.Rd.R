library(TeachingDemos)


### Name: panel.my.symbols
### Title: Draw Symbols (User Defined) on a Lattice Plot
### Aliases: panel.my.symbols
### Keywords: aplot dplot hplot

### ** Examples

if(require(lattice)) {
  tmpdf <- data.frame( x=1:10, y=1:10, g=rep( c("A","B"), each=5 ),
	z=c(1:5,5:1) )

  xyplot( y ~ x, tmpdf, panel=panel.my.symbols, symb=ms.female, inches=0.3 )

  xyplot( y ~ x | g, tmpdf, panel=panel.my.symbols, symb=ms.male, inches=0.3)

  xyplot( y ~ x, tmpdf, panel=panel.superpose, groups=g,
	panel.groups= function(group.number, ...) {
		if(group.number==1) {
			panel.my.symbols(..., symb=ms.male)
		} else {
			panel.my.symbols(..., symb=ms.female)
		} },
		inches=0.3
	)

  xyplot( y ~ x, tmpdf, panel=panel.my.symbols, symb=ms.polygram, n=tmpdf$z,
		inches=0.3)

  xyplot( y ~ x | g, tmpdf, panel=panel.my.symbols, symb=ms.polygram,
		n=tmpdf$z, inches=0.3)

  xyplot( y ~ x, tmpdf, panel=panel.superpose, groups=g,
	panel.groups = panel.my.symbols,
		inches=0.3, symb=ms.polygon, n=tmpdf$z, polygon=TRUE,
		adj=rep(c(0,pi/4),5)
	)
}



