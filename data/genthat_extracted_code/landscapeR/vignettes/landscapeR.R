## ---- message=FALSE, warning=FALSE---------------------------------------
library(landscapeR)
library(raster)
m <- matrix(0, 33, 33)
r <- raster(m, xmn=0, xmx=10, ymn=0, ymx=10)

## ---- eval=FALSE---------------------------------------------------------
#  rr <- makePatch(r, size=500, rast=TRUE)
#  plot(rr)

## ---- warning=FALSE------------------------------------------------------
num <- 5
size <- 15
rr <- makeClass(r, num, size)
plot(rr)

## ---- warning=FALSE------------------------------------------------------
num <- 75
size <- 10
rr <- makeClass(r, num, size)
plot(rr)

## ------------------------------------------------------------------------
num <- 5
size <- c(1,5,10,20,50)
pts <- c(1, 33, 1089, 1057, 545)
rr <- makeClass(r, num, size, pts)
plot(rr)

## ---- fig.width=6--------------------------------------------------------
rr <- makeClass(r, 3, 100, val=1) 
rr <- makeClass(rr, 5, 50, val=3) ## Creates a second class in the landscape with value 3
par(mfrow=c(1,2))
plot(rr)
rr <- makeClass(rr, 1, 250, bgr=c(0,1), val=2) ## Builds a third class, allowed on background and class 1.
plot(rr)

## ---- eval=FALSE---------------------------------------------------------
#  rr <- makeClass(r, 1, size=500)
#  plot(rr)

## ------------------------------------------------------------------------
patchSize <- 500
class <- 2
centre <- 545
rr <- makeClass(r, 1, patchSize, centre, val=class)
plot(rr)

## ---- warning=FALSE------------------------------------------------------
rr <- makeClass(rr, 1, 100, bgr=class, val=1)
plot(rr, axes=FALSE)

## ---- fig.width=6, warning=FALSE-----------------------------------------
rr <- makeClass(r, 1, patchSize, centre)
par(mfrow=c(1,2))
plot(rr)
rex <- expandClass(rr, 1, size=250)
plot(rex)

## ---- fig.width=6, warning=FALSE-----------------------------------------
rr <- makeClass(r, 5, 100)
rr <- makeClass(rr, 5, 50, val=2) ## Creates a second class in the landscape with value 2
par(mfrow=c(1,2))
plot(rr)
rex <- expandClass(rr, 2, 250, bgr = c(0,1))
plot(rex)

## ---- fig.width=6, warning=FALSE-----------------------------------------
m[,17] <- 1
r <- raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
par(mfrow=c(1,2))
plot(r)
rr <- expandClass(r, 1, 200)
plot(rr)

## ---- warning=FALSE------------------------------------------------------
m[] <- 0
r <- raster(m, xmn=0, xmx=10, ymn=0, ymx=10)
rr <- makeLine(r, size=50, spt = 545, direction=45, convol=0.05, val=2, rast=TRUE)
plot(rr)

## ---- fig.width=4, fig.height=4, warning=FALSE---------------------------
rr <- matrix(0,100,100)
rr <- raster(rr, xmn=0, xmx=10, ymn=0, ymx=10)
for(i in c(550, 3050, 5050, 7550)){
  rr = makeLine(rr, size=50, rast=TRUE, spt=i, direction=135, convol=0.25) 
}
plot(expandClass(rr, 1, 250))

## ---- fig.width=6, warning=FALSE-----------------------------------------
rr <- makeClass(r, 10, 100)
par(mfrow=c(1,2))
plot(rr)
rs <- rmSingle(rr)
plot(rs)

