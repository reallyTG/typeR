library(plotrix)


### Name: triax.fill
### Title: Triangle plot fill
### Aliases: triax.fill
### Keywords: misc

### ** Examples

 # the data will be something like response at different proportions
 fillval<-list(0,c(0,0.1,0),c(0,0.1,0.2,0.1,0),
  c(0,0.1,0.2,0.3,0.2,0.1,0),c(0,0.1,0.2,0.3,0.4,0.3,0.2,0.1,0),
  c(0,0.1,0.2,0.3,0.4,0.5,0.4,0.3,0.2,0.1,0),
  c(0,0,0.1,0.2,0.3,0.4,0.5,0.4,0.3,0.2,0.1,0,0),
  c(0,0,0,0.1,0.1,0.2,0.3,0.4,0.3,0.2,0.1,0.1,0,0,0))
 # use some method of converting values to colors
 fillcol<-sapply(fillval,function(x) {x*10+1} )
 oldpar<-triax.plot(main="Test of triax.fill function")
 triax.fill(fillcol)
 par(oldpar)



