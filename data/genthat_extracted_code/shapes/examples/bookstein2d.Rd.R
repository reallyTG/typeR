library(shapes)


### Name: bookstein2d
### Title: Bookstein's baseline registration for 2D data
### Aliases: bookstein2d
### Keywords: multivariate

### ** Examples

     data(gorf.dat)
     data(gorm.dat)

     bookf<-bookstein2d(gorf.dat)
     bookm<-bookstein2d(gorm.dat)

     plotshapes(bookf$mshape,bookm$mshape,joinline=c(1,6,7,8,2,3,4,5,1))



