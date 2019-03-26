library(longCatEDA)


### Name: colChoose
### Title: Internal Function for Selecting Color Schemes Used by
###   longCatPlot
### Aliases: colChoose

### ** Examples

# color examples
par(mfrow=c(2,3), bg='wheat')
times <- c(1,100,200,300,400,500,600)
f3lc <- longCat( example3, times, Labels=rep('',5) )
longCatPlot(f3lc, main='colScheme=gray', colScheme='gray', 
  lwd=.1, ylab='', legendBuffer = .25)
longCatPlot(f3lc, main='colScheme=rainbow', colScheme='rainbow', 
  lwd=.1, ylab='', legendBuffer = .25)
longCatPlot(f3lc, main='colScheme=heat', colScheme='heat', 
  lwd=.1, ylab='', legendBuffer = .25)
longCatPlot(f3lc, main='colScheme=terrain', colScheme='terrain', 
  lwd=.1, ylab='', legendBuffer = .25)
longCatPlot(f3lc, main='colScheme=topo', colScheme='topo', 
  lwd=.1, ylab='', legendBuffer = .25)
longCatPlot(f3lc, main='colScheme=cm', colScheme='cm', 
  lwd=.1, ylab='', legendBuffer = .25)
par(mfrow=c(1,1), bg='transparent')

## Not run: 
##D # illustrate the use of colors from the package RColorBrewer
##D library(RColorBrewer)
##D par(mfrow=c(2,3), bg='cornsilk3')
##D longCatPlot(f3lc, main='RColorBrewer: Blues', cols=brewer.pal(f3lc$nfactors, "Blues"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='RColorBrewer: Greens', cols=brewer.pal(f3lc$nfactors, "Greens"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='RColorBrewer: PuBuGn', cols=brewer.pal(f3lc$nfactors, "PuBuGn"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='RColorBrewer: YlOrRd', cols=brewer.pal(f3lc$nfactors, "YlOrRd"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='RColorBrewer: Spectral', cols=brewer.pal(f3lc$nfactors, "Spectral"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='RColorBrewer: Accent', cols=brewer.pal(f3lc$nfactors, "Accent"), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D par(mfrow=c(1,1), bg='transparent')
##D 
##D # illustrate the use of colors from the package colorspace
##D library(colorspace)
##D par(mfrow=c(2,3), bg='cornsilk3')
##D longCatPlot(f3lc, main='colorspace: rainbow_hcl', cols=rainbow_hcl(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='colorspace: sequential_hcl', cols=sequential_hcl(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='colorspace: heat_hcl', cols=heat_hcl(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='colorspace: terrain_hcl', cols=terrain_hcl(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='colorspace: diverge_hcl', cols=diverge_hcl(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D longCatPlot(f3lc, main='colorspace: diverge_hsv', cols=diverge_hsv(f3lc$nfactors), 
##D             lwd=.1, ylab='', legendBuffer = .25)
##D par(mfrow=c(1,1), bg='transparent')
## End(Not run)



