library(metRology)


### Name: gplot
### Title: Grouped plots of type "h"
### Aliases: gplot
### Keywords: hplot

### ** Examples

   data(RMstudy)
   h <- with(RMstudy, mandel.h(RMstudy[2:9], g=Lab))
   gplot(h, las=2) 
   	#Note the absence of indicator lines, title etc. 
   	#compared to plot(h)



