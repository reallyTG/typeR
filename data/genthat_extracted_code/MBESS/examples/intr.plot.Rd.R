library(MBESS)


### Name: intr.plot
### Title: Regression Surface Containing Interaction
### Aliases: intr.plot
### Keywords: regression

### ** Examples

##  A way to replicate the example given by Cohen et al. (2003) (pp. 258--263):
##  The regression equation with interaction is y=.2X+.6Z+.4XZ+2
##  To plot a regression surface and regression lines of Y on X holding Z 
##  at -1, 0, and 1 standard deviation above the mean

x<- c(0,2,4,6,8,10)
z<-c(0,2,4,6,8,10)
intr.plot(b.0=2, b.x=.2, b.z=.6, b.xz=.4, x=x, z=z)

## input limits of the predictors instead of specific x and z predictor vectors
intr.plot(b.0=2, b.x=.2, b.z=.6, b.xz=.4, x.min=5, x.max=10, z.min=0, z.max=20)

intr.plot(b.0=2, b.x=.2, b.z=.6, b.xz=.4, x.min=0, x.max=10, z.min=0, z.max=10, 
col="gray", hor.angle=-65, vert.angle=10)

##  To plot a black-and-white figure
intr.plot(b.0=2, b.x=.2, b.z=.6, b.xz=.4, x.min=0, x.max=10, z.min=0, z.max=10, 
gray.scale=TRUE)

## to adjust the tick marks on the axes
intr.plot(b.0=2, b.x=.2, b.z=.6, b.xz=.4, x.min=0, x.max=10, z.min=0, z.max=10, 
ticktype="detailed", nticks=8)



