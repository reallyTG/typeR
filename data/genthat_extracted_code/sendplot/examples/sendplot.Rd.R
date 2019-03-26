library(sendplot)


### Name: sendplot
### Title: CREATES WEB BROWSER INTERACTIVE PLOT - DEPRECATED
### Aliases: sendplot
### Keywords: methods

### ** Examples

# see vignette for more advanced example


#
# first example of scatterplot
#
# note: we assume that the function has already been run once
#       to retrieve the pixel locations of the upper left and lower
#       right corners. If this had not been the case, the function would
#       need to have been run with bound.pt = T, perhaps paint = T
#       
#
# The up.left and low.right values are correct if run in 
#  unix/linux environment - for window users the coordinates will not be
#  correct


library(sendplot)

# create a layout with four plots
mat = matrix(c(rep(c(rep(3,8),rep(5,2)),1),
       rep(c(rep(1,8),rep(4,2)),14),
       rep(c(rep(2,8),rep(6,2)),2)),
       ncol=10,byrow=TRUE)

# create x and y points 
x=rnorm(16)
y=rnorm(16)

# list of plot calls - what plot call to use for the four plots
plot.calls = c("plot(x,y,col='green', pch=3)","plot(0,0, col='purple',pch=22,bg='purple')","plot(1:3,1:3, type='b',pch=21,bg='red',col='red')","curve(x^3-3*x,-2,2, col='blue')")

# create matrix of margin parameters
mai.mat = matrix(0, ncol=4, nrow=4, byrow=TRUE)
m1 = c(.25,0,.25,.5)
m2 = c(.4,0,.25,.5)
m3 = c(.1,0,.1,.5)
m4 = c(.25,0,.25,0)
mai.mat[1,] = m1
mai.mat[2,] = m2
mai.mat[3,] = m3
mai.mat[4,] = m4

# x and y limits of the first graph in the plot call
# in this case xlim and ylim values of plot(x,y,col='green', pch=3)
xlim = range(x, na.rm=TRUE)
xlim = c(xlim[1]-.1, xlim[2]+.1)
ylim = range(y, na.rm=TRUE)
ylim = c(ylim[1]-.1, ylim[2]+.1)

# data frame of sample information to display in interactive plot
# since scatterplot has equal number of pts no need to be x, y, or xy specific
x.lbls = list()
x.lbls$test = rep(c("a","b","c","d"),4)
x.lbls$num = 1:16
x.lbls = as.data.frame(x.lbls)



#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct


sendplot(mat, plot.calls, mai.mat,
         xlim=xlim, ylim=ylim,type="scatterplot",
         x=x,y=y,z=NA,
         x.lbls=x.lbls, y.lbls=NA, xy.lbls=NA, source.plot=NA,
         resize="1200x1700", fname.root="testScatterplot",dir=direct,
         paint=FALSE, bound.pt=FALSE,img.prog = NA,
         spot.radius=5, up.left=c(186,199),low.right=c(767,1264))

# there will now be a static postscript and .png file that may be viewed
# as well as an html file that can be opened with firefox that has
# interactive version 



#
#
# second example of image
#
# note: we assume that the function has already been run once
#       to retrieve the pixel locations of the upper left and lower
#       right corners. If this had not been the case, the function would
#       need to have been run with perhaps paint = T 
#       
#
# The up.left and low.right values are correct if run in 
#  unix/linux environment - for window users the coordinates will not be
#  correct


library(sendplot)

# create a layout with four plots
mat = matrix(c(rep(c(rep(3,8),rep(5,2)),1),
       rep(c(rep(1,8),rep(4,2)),14),
       rep(c(rep(2,8),rep(6,2)),2)),
       ncol=10,byrow=TRUE)

# create x and y points, and z matrix of values for image 
y=c(1:5,10,20,22,30,36) 
x=c(1,2,4,5,8)
z=matrix(rnorm(50), nrow=5, ncol=10)

# list of plot calls - what plot call to use for the four plots
plot.calls = c("image(x=x, y=y, z=z)",
    "plot(0,0, col='purple',pch=22,bg='purple')","plot(1:3,1:3, type='b',pch=21,bg='red',col='red')","curve(x^3-3*x,-2,2, col='blue')")

# create matrix of margin parameters
mai.mat = matrix(0, ncol=4, nrow=4, byrow=TRUE)
m1 = c(.25,0,.25,.5)
m2 = c(.4,0,.25,.5)
m3 = c(.1,0,.1,.5)
m4 = c(.25,0,.25,0)
mai.mat[1,] = m1
mai.mat[2,] = m2
mai.mat[3,] = m3
mai.mat[4,] = m4

# mock data frames of x specific and y specific data
x.lbls = list()
x.lbls$test = c("a","b","c","d","e")
x.lbls$num = 1:5
x.lbls = as.data.frame(x.lbls)
y.lbls = list()
y.lbls$test2 = rep(c("f","g","h","i","j"),2)
y.lbls$num2 = 10:1
y.lbls=as.data.frame(y.lbls)

# mock list of data frames of xy specific data
xy.lbls = list()
xy.lbls$one = matrix(1,nrow=10,ncol=5)
xy.lbls$two = matrix(2,nrow=10,ncol=5)
xy.lbls$aa = matrix("a", nrow=10,ncol=5)





sendplot(mat, plot.calls, mai.mat,
         xlim=NA, ylim=NA,type="image",
         x=x,y=y,z=z, z.value="value",
         x.lbls=x.lbls, y.lbls = y.lbls, xy.lbls=xy.lbls,
         resize="1200x1700", fname.root="testimage",source.plot=NA,
         dir=direct, paint=FALSE,img.prog = NA, bound.pt=FALSE, spot.radius=8,
         up.left=c(163,156),low.right=c(790,1310))


# there will now be a static postscript and .png file that may be viewed
# as well as an html file that can be opened with firefox that has
# interactive version 






