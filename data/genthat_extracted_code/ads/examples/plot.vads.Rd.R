library(ads)


### Name: plot.vads
### Title: Plot local density values
### Aliases: plot.vads plot.vads.dval plot.vads.k12val plot.vads.kval
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  # local density in a rectangle sampling window
  dswr <- dval(spp(BP$trees, win=BP$rect), 25, 1, 11, 9)
  plot(dswr)
  # display only distance r from 5 to 10 with null symbols as red crosses
  plot(dswr, select=c(5:10), char0=3, col0="red")
  
  # local L(r) values in a circular sampling window
  lvswc <- kval(spp(BP$trees, win=c(55,45,45)), 25, 0.5)
  plot(lvswc)
  # display square symbols in blue for selected values of r and remove title
  plot(lvswc, chars="squares", cols="blue", select=c(5,7.5,10,12.5,15), main=NULL)
  
   # local K12(r) values (1="beech", 2="oak") in a complex sampling window
  k12swrt <- k12val(spp(BP$trees, win=BP$rect, tri=BP$tri1, marks=BP$species), 25, 1)
  plot(k12swrt, opt="kval")



