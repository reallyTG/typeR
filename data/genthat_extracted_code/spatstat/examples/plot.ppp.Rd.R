library(spatstat)


### Name: plot.ppp
### Title: plot a Spatial Point Pattern
### Aliases: plot.ppp
### Keywords: spatial hplot

### ** Examples

   plot(cells)

   plot(cells, pch=16)

   # make the plotting symbols larger (for publication at reduced scale)
   plot(cells, cex=2)

   # set it in spatstat.options
   oldopt <- spatstat.options(par.points=list(cex=2))
   plot(cells)
   spatstat.options(oldopt)

   # multitype 
   plot(lansing)

   # marked by a real number
   plot(longleaf)

   # just plot the points
   plot(longleaf, use.marks=FALSE)
   plot(unmark(longleaf)) # equivalent

   # point pattern with multiple marks
   plot(finpines)
   plot(finpines, which.marks="height")

   # controlling COLOURS of points
   plot(cells, cols="blue")
   plot(lansing, cols=c("black", "yellow", "green", 
                        "blue","red","pink"))
   plot(longleaf, fg="blue")

   # make window purple
   plot(lansing, border="purple")
   # make everything purple
   plot(lansing, border="purple", cols="purple", col.main="purple",
                 leg.args=list(col.axis="purple"))
 
   # controlling PLOT CHARACTERS for multitype pattern
   plot(lansing, chars = 11:16)
   plot(lansing, chars = c("o","h","m",".","o","o"))

   ## multitype pattern mapped to symbols
   plot(amacrine, shape=c("circles", "squares"), size=0.04)
   plot(amacrine, shape="arrows", direction=c(0,90), size=0.07)

   ## plot trees as trees!
   plot(lansing, shape="arrows", direction=90, cols=1:6)

   # controlling MARK SCALE for pattern with numeric marks
   plot(longleaf, markscale=0.1)
   plot(longleaf, maxsize=5)
   plot(longleaf, meansize=2)

   # draw circles of diameter equal to nearest neighbour distance
   plot(cells %mark% nndist(cells), markscale=1, legend=FALSE)

   # inspecting the symbol map
   v <- plot(amacrine)
   v

   ## variable colours ('cols' not 'col')
   plot(longleaf, cols=function(x) ifelse(x < 30, "red", "black"))

   ## re-using the same mark scale
   a <- plot(longleaf)
   juveniles <- longleaf[marks(longleaf) < 30]
   plot(juveniles, symap=a)

   ## numerical marks mapped to symbols of fixed size with variable colour
   ra <- range(marks(longleaf))
   colmap <- colourmap(terrain.colors(20), range=ra)
   ## filled plot characters are the codes 21-25
   ## fill colour is indicated by 'bg'
   sy <- symbolmap(pch=21, bg=colmap, range=ra)
   plot(longleaf, symap=sy)

   ## or more compactly..
   plot(longleaf, bg=terrain.colors(20), pch=21, cex=1)

   ## clipping
   plot(humberside)
   B <- owin(c(4810, 5190), c(4180, 4430))
   plot(B, add=TRUE, border="red")
   plot(humberside, clipwin=B, main="Humberside (clipped)")



