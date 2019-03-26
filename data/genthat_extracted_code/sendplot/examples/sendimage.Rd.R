library(sendplot)


### Name: sendimage
### Title: INTERACTIVE IMAGE - DEPRECATED
### Aliases: sendimage
### Keywords: methods

### ** Examples

# load the library 
   library("sendplot")

# set up vectors x,y, and z
   x = 1:4
   y = 1:8
   z = t(matrix(rnorm(32), ncol=4))

# create plot call for graph
  plot.calls = "image(x=x, y=y, z=z)"


#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct



# run sendImage
# note: we have already figured out appropriate up.left and low.right
#      values. if these were not known, the function should be run
#      with bound.pt=T (and maybe kolourpaint=T) to find pixil
#      locations

 sendimage(plot.call = plot.calls, x=x, y=y, z=z,
           up.left=c(100,99),low.right=c(738,917),
           bound.pt=FALSE, source.plot=NA, paint=FALSE,
           img.prog=NA,fname.root="testImg",dir=direct )






