library(gplots)


### Name: space
### Title: Space points in an x-y plot so they don't overlap.
### Aliases: space
### Keywords: dplot

### ** Examples

   x <- rep(1:5, 10)
   y <- round(rnorm(length(x),x))

   prepar <- par("mfrow")
   par(mfrow=c(1,3))

   # standard x-y plot: noverlapping points are hidden
   plot(x,y)
   title("Standard Plot") 

   # 'spaced' plot: overlapping points are spread out and visible
   plot(space(x,y))
   title("Plot with 'space'")


   # 'spaced' plot: overlapping points are spread out along y and visible
   plot(space(x,y, direction='y'))
   title("Plot with 'space', direction='y' ")


   # 'sunflower' plot, another approach, overlapping points are
   # indicated via petals
   sunflowerplot(x,y)
   title("Sunflower Plot")

   ## Don't show: 
     # check that missign values correctly handled
     x <- c(x,NA)
     y <- c(y,NA)
     plot(space(x,y))
   
## End(Don't show)

   par(mfrow=prepar)



