library(sendplot)


### Name: sendxy
### Title: INTERACTIVE SCATTERPLOT- DEPRECATED
### Aliases: sendxy
### Keywords: methods

### ** Examples

# load the library
  library("sendplot")

# create some vectors of points
   x1 = 1:7
   y1 = 1:7  
   x2 = 7:1
   y2 = rep(4,7)
# create master vector of all points
   x = c(x1,x2)
   y = c(y1,y2)

# create data frame of information to display in interactive  
   xy.lbls = list()
   xy.lbls$test = rep(c("a","b","c","d","e","f","g"),2)
   xy.lbls$num = 1:14
   xy.lbls = as.data.frame(xy.lbls)

# create plot.call for graph
   plot.calls = "plot(x1,y1,col='green', pch=3, cex=1.5); points(x2,y2,
pch=4, cex=1.5, col='purple')"


#
# Note this plot call could have also been run with 
#
#   plot.calls = "plot(x1,y1,col='green', pch=3, cex=1.5)"
#  
#  and then setting the
#        plt.extras$plot1 = "points(x2,y2,pch=4, cex=1.5, col='purple')"


#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct




# run sendxy
# note: we have already figured out appropriate up.left and low.right
#      values. if these were not known, the function should be run
#      with bound.pt=T (and maybe paint=T) to find pixil
#      locations
#
# The up.left and low.right values are correct if run in 
#  unix/linux environment - for window users the coordinates will not be
#  correct

  sendxy(plot.call = plot.calls, x=x, y=y,
         xy.lbls=xy.lbls, plt.extras=NA,
         bound.pt=FALSE, source.plot=NA, paint=FALSE,
         img.prog=NA,fname.root="testXY",dir=direct,
         up.left=c(124,130),low.right=c(713,883))





