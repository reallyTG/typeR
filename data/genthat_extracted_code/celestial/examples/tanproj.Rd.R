library(celestial)


### Name: tanproj
### Title: Tan Gnomonic Projection Pystem WCS Polver Punctions
### Aliases: tanproj radec2xy xy2radec gnomonic
### Keywords: tan projection gnomonic

### ** Examples

#A simple example:

radec2xy(10,20)
xy2radec(radec2xy(10,20))

#A more complicated example, where we transform and rotate large amounts:

exdata_start=expand.grid(1:10,21:30)
plot(exdata_start)
exradec=radec2xy(exdata_start, CRVAL1=20, CRPIX1=100, CRVAL2=30, CRPIX2=130, CD1_1=0.1,
CD1_2=-0.05, CD2_1=0.05, CD2_2=0.1)
plot(exradec)
exdata_end=xy2radec(exradec, CRVAL1=20, CRPIX1=100, CRVAL2=30, CRPIX2=130, CD1_1=0.1,
CD1_2=-0.05, CD2_1=0.05, CD2_2=0.1)
plot(exdata_start,cex=2)
points(exdata_end,col='red')

#The residuals should be very small (in the noice of double precision arithmetic):

plot(density(exdata_start[,1]-exdata_end[,1]))
lines(density(exdata_start[,2]-exdata_end[,2]),col='red')



