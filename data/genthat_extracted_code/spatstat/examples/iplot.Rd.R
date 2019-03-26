library(spatstat)


### Name: iplot
### Title: Point and Click Interface for Displaying Spatial Data
### Aliases: iplot iplot.ppp iplot.layered iplot.linnet iplot.lpp
###   iplot.default
### Keywords: spatial hplot

### ** Examples

   if(interactive() && require(rpanel)) {
      iplot(cells)
      iplot(amacrine)
      iplot(lansing)
      L <- layered(D=distmap(cells), P=cells,
            plotargs=list(list(ribbon=FALSE), list(pch=16)))
      iplot(L)
   }



