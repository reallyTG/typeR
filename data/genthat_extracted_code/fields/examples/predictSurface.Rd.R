library(fields)


### Name: predictSurface
### Title: Evaluates a fitted function or the prediction error as a surface
###   that is suitable for plotting with the image, persp, or contour
###   functions.
### Aliases: predictSurface predictSurface.default predictSurface.mKrig
###   predictSurface.Krig predictSurface.fastTps predictSurfaceSE
###   predictSurfaceSE.default predict.surface
### Keywords: spatial

### ** Examples

fit<- Tps( BD[,1:4], BD$lnya)  # fit surface to data 

# evaluate fitted surface for  first two 
# variables holding other two fixed at median values

out.p<- predictSurface(fit)
surface(out.p, type="C") 

#
# plot surface for second and fourth variables 
# on specific grid. 

glist<- list( KCL=29.77, MgCl2= seq(3,7,,25), KPO4=32.13, 
                     dNTP=seq( 250,1500,,25))

out.p<- predictSurface(fit, glist)
surface(out.p, type="C")

out.p<- predictSurfaceSE(fit, glist)
surface(out.p, type="C")
  



