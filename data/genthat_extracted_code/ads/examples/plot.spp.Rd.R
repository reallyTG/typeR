library(ads)


### Name: plot.spp
### Title: Plot a Spatial Point Pattern object
### Aliases: plot.spp
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP<-BPoirier
  
  # a univariate point pattern in a rectangle sampling window
  plot(spp(BP$trees, win=BP$rect))
  
 # a univariate point pattern in a circular sampling window
 #with all points and graduations displayed
 plot(spp(BP$trees, win=c(55,45,45)), out=TRUE, scale=TRUE)
 
 # a univariate point pattern in a complex sampling window
 #with points outside the sampling window displayed (in red colour)
 plot(spp(BP$trees, win=BP$rect, tri=BP$tri1), out=TRUE)
  
 # a multivariate point pattern in a rectangle sampling window
 plot(spp(BP$trees, win=BP$rect, marks=BP$species))
 
 # a multivariate point pattern in a circular sampling window
 #with all points inside the sampling window displayed in blue colour
 #and all points outside displayed with the symbol "+" in red colour
 plot(spp(BP$trees, win=c(55,45,45), marks=BP$species), out=TRUE, cols=c("blue","blue","blue"), 
 chars.out=c("+","+","+"), cols.out=c("red","red","red"))
 
 # a marked point pattern in a rectangle sampling window
 #with circles in green colour
  plot(spp(BP$trees, win=BP$rect, marks=BP$dbh), cols="green")

 # a marked point pattern in a circular sampling window
 #with squares in red colour inside and circles in blue colour outside
  plot(spp(BP$trees, win=c(55,45,45), marks=BP$dbh), out=TRUE, chars="squares", 
  cols="red", cols.out="blue")



