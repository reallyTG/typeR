library(OSMscale)


### Name: randomPoints
### Title: Distanced random points
### Aliases: randomPoints
### Keywords: datagen spatial

### ** Examples


P <- randomPoints(xmin=200,xmax=700, ymin=300,ymax=680, number=60,mindist=10, asp=1)
rect(xleft=200, ybottom=300, xright=700, ytop=680, col=NA, border=1)

format( round(P,4), trim=FALSE)

for(i in 1:10)
{
rp <- randomPoints(xmin=0,xmax=20, ymin=0,ymax=20, number=20, mindist=3, plot=FALSE)
plot(rp, las=1, asp=1, pch=16)
abline(h=0:30*2, v=0:30*2, col=8); box()
for(i in 1:nrow(rp))
    berryFunctions::circle(rp$x[i],rp$y[i], r=3, col=rgb(1,0,0,alpha=0.2), border=NA)
}




