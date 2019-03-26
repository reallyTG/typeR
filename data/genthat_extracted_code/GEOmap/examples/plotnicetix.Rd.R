library(GEOmap)


### Name: plotnicetix
### Title: Plot Lat-Lon tick marks
### Aliases: plotnicetix
### Keywords: misc

### ** Examples


proj = setPROJ(7, LAT0 = 0 , LON0= -93)



rx = c(652713.4, 656017.4)
ry = c(1629271, 1631755)

plot(rx, ry, type='n', asp=1, axes=FALSE , ann=FALSE)
plotnicetix(rx, ry, proj, PMAT=NULL)




