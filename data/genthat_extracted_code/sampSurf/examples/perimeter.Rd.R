library(sampSurf)


### Name: perimeter
### Title: Function to Return the Graphical Perimeter of an Object in
###   Package 'sampSurf'
### Aliases: perimeter
### Keywords: ~kwd1 ~kwd2

### ** Examples

showMethods("perimeter")
dlogs = downLogs(15, xlim=c(0,20), ylim=c(0,20), buttDiams=c(25,35))
dlogs.perim = perimeter(dlogs)
plot(dlogs.perim, axes=TRUE)
plot(dlogs, add=TRUE)
bbox(dlogs.perim)



