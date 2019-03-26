library(MBESS)


### Name: intr.plot.2d
### Title: Plotting Conditional Regression Lines with Interactions in Two
###   Dimensions
### Aliases: intr.plot.2d
### Keywords: regression

### ** Examples

## A situation where one regression line is outside the default scope of the coordinates
intr.plot.2d(b.0=16, b.x=2.2, b.z=2.6, b.xz=.4, x.min=0, x.max=20, mean.z=0, sd.z=3)

## Adjust the scope of x and y axes so that proper sections of regression lines can be seen 
intr.plot.2d(b.0=16, b.x=2.2, b.z=2.6, b.xz=.4, x.min=0, x.max=50, mean.z=0, 
sd.z=3, xlim=c(0,50), ylim=c(-20,100) )

## Use specific vector(s) to define the predictor(s) 
intr.plot.2d(b.0=16, b.x=2.2, b.z=2.6, b.xz=.4, x=c(1:10), z=c(0,2,4,6,8,10))

intr.plot.2d(b.0=16, b.x=2.2, b.z=2.6, b.xz=.4, x.min=0, x.max=20, 
z=c(1,3,6,7,9,13,16,20), ylim=c(0,100))

## Change the position of the legend so that it does not block regression lines
intr.plot.2d(b.0=10, b.x=-.3, b.z=1, b.xz=.5, x.min=0, x.max=40, mean.z=-5, sd.z=3, 
ylim=c(-100,100),legend.pos="topright" )




