library(spatstat)


### Name: BadGey
### Title: Hybrid Geyer Point Process Model
### Aliases: BadGey
### Keywords: spatial models

### ** Examples

   BadGey(c(0.1,0.2), c(1,1))
   # prints a sensible description of itself
   BadGey(c(0.1,0.2), 1)
   data(cells) 

   # fit a stationary Baddeley-Geyer model
   ppm(cells, ~1, BadGey(c(0.07, 0.1, 0.13), 2))

   # nonstationary process with log-cubic polynomial trend
   ## Not run: 
##D    ppm(cells, ~polynom(x,y,3), BadGey(c(0.07, 0.1, 0.13), 2))
##D    
## End(Not run)



