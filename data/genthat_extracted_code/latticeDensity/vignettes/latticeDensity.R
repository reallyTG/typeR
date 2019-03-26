## ----part1, fig.height=4,fig_width=4-------------------------------------
library(latticeDensity)
library(sp)
plot.new()
data(polygon1)
head(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.02)
plot(nodeFillingOutput)

## ----part2, fig_height=3,fig_width=5-------------------------------------
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)

## ----part3, message=FALSE------------------------------------------------
library(splancs, quietly=TRUE)
Pointdata <- csr(polygon1,150)
colnames(Pointdata) <- c("x","y")
Pointdata <- Pointdata[Pointdata[,1]<0.5,]
full_polygon <- rbind(polygon1,polygon1[1,])
colnames(full_polygon) <- c("x","y")
plot(full_polygon,type="l",plt=c(0,1,0,1))
title("Simulated point process")
points(Pointdata,pch=19)

out <- crossvalDensity(formLatticeOutput,PointPattern=Pointdata, 
  M=0.5,max_steps = 150)
plot(1:150,out$ucv,type="l")
out$k

## ----part4,fig.width=4,fig.height=4, message=FALSE-----------------------
densityOut <- createDensity(formLatticeOutput,
  PointPattern=Pointdata, k=out$k,intensity=FALSE, sparse = TRUE)
#plot(densityOut)

## ----part5---------------------------------------------------------------
homerange(densityOut, percent=0.95)

## ----part6---------------------------------------------------------------
x_poly = c(0, 0, 0.2, 0.2, 1, 1, 1.2, 1.2, 2, 2, 0)
y_poly = c(0, 1, 1, 0.2, 0.2, 1, 1, 0.2, 0.2, 0, 0)
polyg <- cbind(x_poly, y_poly)
nodeFillingOutput <- nodeFilling(polyg, node_spacing=0.15)
plot(nodeFillingOutput)

## ----part65--------------------------------------------------------------
plot(nodeFillingOutput)
text(nodeFillingOutput$nodes+rep(c(0.1,0),each=23),col=2,labels=letters[1:23])

## ----part7---------------------------------------------------------------
flo <- formLattice(nodeFillingOutput)
plot(flo)

## ----part8, message=FALSE,fig.height=5,fig.width=7-----------------------
PD = rbind(c(1.5,0.1),c(1.6,0.1),c(1.1,0.5))
out <- createDensity(flo,PointPattern=PD, 
  M=0.5, k=1)
plot(out)
text(out$nodes, labels=round(out$probs,4),cex=0.6)

## ----part9, message=FALSE,fig.height=5,fig.width=7-----------------------
out <- createDensity(flo,PointPattern=PD, 
  M=0.5, k=600)
plot(out)
text(out$nodes, labels=round(out$probs,3),cex=0.6)

## ----part10, message=FALSE-----------------------------------------------
data(nparExample)
attach(nparExample)
plot.new()
#  Simulate a response variable
index1 = (grid2[,2]<0.8)|(grid2[,1]>0.6)
Z = rep(NA,length(grid2[,1]))
n1 = sum(index1)
n2 = sum(!index1)
Z[index1] <- 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
Z[!index1] <- -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#
coords=rbind(polygon2,polygon2[1,])
plot(coords,type="l")
points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
text(grid2,labels=round(Z,1),pos=4,cex=0.5)
nodeFillingOutput <- nodeFilling(poly=polygon2, node_spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
NparRegOut <- createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=4)
plot(NparRegOut)
names(NparRegOut)

## ----SEmap, message=FALSE------------------------------------------------
varianceMapOut <- varianceMap(formLatticeOutput,Z,PointPattern=grid2,k=20)
plot(varianceMapOut)

## ----part11, message=FALSE-----------------------------------------------
library(rgdal)
xy <- cbind(c(118, 118.3, 118.7, 119), c(10, 25, 48, 49, 50))
now_in_UTM <- project(xy, proj = "+proj=utm +zone=51 ellps=WGS84")
now_in_UTM

## ----part12, message=FALSE, fig.width=4, fig.height=4--------------------
boundary <- cbind(c(0,0,0.2,1,1),c(0,0.8,1,1,0))
hole1 <- cbind(c(0.1,0.3,0.4),c(0.2,0.3,0.8))
hole2 <- cbind(c(0.8,0.9,0.9),c(0.6,0.7,0.95))
region <- nodeFilling(poly = boundary, node_spacing = 0.03, hole_list = list(hole1, hole2))
plot(region)
lattice_output = formLattice(region)
plot(lattice_output)

