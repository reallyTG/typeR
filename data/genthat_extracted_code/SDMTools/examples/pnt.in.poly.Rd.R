library(SDMTools)


### Name: pnt.in.poly
### Title: Point in Polygon
### Aliases: pnt.in.poly

### ** Examples

#define the points and polygon
pnts = expand.grid(x=seq(1,6,0.1),y=seq(1,6,0.1))
polypnts = cbind(x=c(2,3,3.5,3.5,3,4,5,4,5,5,4,3,3,3,2,2,1,1,1,1,2),
    y=c(1,2,2.5,2,2,1,2,3,4,5,4,5,4,3,3,4,5,4,3,2,2))

#plot the polygon and all points to be checked
plot(rbind(polypnts, pnts))
polygon(polypnts,col='#99999990')

#create check which points fall within the polygon
out = pnt.in.poly(pnts,polypnts)
head(out)

#identify points not in the polygon with an X
points(out[which(out$pip==0),1:2],pch='X')



