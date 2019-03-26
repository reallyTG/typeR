## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----load libraries, echo = T--------------------------------------------
library(vegclust)
library(RColorBrewer)

## ------------------------------------------------------------------------
#Description of sites and surveys
sites = c(1,1,1,1,2,2,2,2,3,3,3,3)
surveys=c(1,2,3,4,1,2,3,4,1,2,3,4)

## ------------------------------------------------------------------------
#Raw data table
xy<-matrix(0, nrow=12, ncol=2)
xy[2,2]<-1
xy[3,2]<-2
xy[4,2]<-3
xy[5:6,2] <- xy[1:2,2]
xy[7,2]<-1.5
xy[8,2]<-2.0
xy[5:6,1] <- 0.25
xy[7,1]<-0.5
xy[8,1]<-1.0
xy[9:10,1] <- xy[5:6,1]+0.25
xy[11,1] <- 1.0
xy[12,1] <-1.5
xy[9:10,2] <- xy[5:6,2]
xy[11:12,2]<-c(1.25,1.0)
cbind(sites,surveys,xy)

## ------------------------------------------------------------------------
#Distance matrix
D = dist(xy)
D

## ----pcoa, fig = TRUE, fig.height=5, fig.width=5, fig.align = "center"----
trajectoryPCoA(D, sites, surveys, traj.colors = c("black","red", "blue"), lwd = 2)
legend("topleft", col=c("black","red", "blue"), 
       legend=c("Trajectory 1", "Trajectory 2", "Trajectory 3"), bty="n", lty=1, lwd = 2)

## ------------------------------------------------------------------------
trajectoryLengths(D, sites, surveys)
trajectoryAngles(D, sites, surveys)

## ------------------------------------------------------------------------
trajectoryDirectionality(D, sites, surveys)

## ------------------------------------------------------------------------
trajectoryProjection(D, 1:4, 1:4)
trajectoryProjection(D, 5:8, 5:8)

## ------------------------------------------------------------------------
trajectoryProjection(D, 3, 5:8)

## ------------------------------------------------------------------------
trajectoryConvergence(D, sites, surveys, symmetric = TRUE)

## ------------------------------------------------------------------------
trajectoryConvergence(D, sites, surveys, symmetric = FALSE)

## ------------------------------------------------------------------------
Ds = segmentDistances(D, sites, surveys)$Dseg
Ds

## ---- echo=T, fig=TRUE, fig.height=6, fig.width=6, fig.align = "center"----
xret = cmdscale(Ds)
par(mar=c(4,4,1,1))
plot(xret, xlab="axis 1", ylab = "axis 2", asp=1, pch=21,
     bg=c(rep("black",3), rep("red",3), rep("blue",3)), 
     xlim=c(-1.5,1), ylim=c(-1,1.5))
text(xret, labels=rep(paste0("s",1:3),3), pos=1)
legend("topleft", pt.bg=c("black","red","blue"), pch=21, bty="n", legend=c("Trajectory 1", "Trajectory 2", "Trajectory 3"))

## ------------------------------------------------------------------------
trajectoryDistances(D, sites, surveys, distance.type = "Hausdorff")
trajectoryDistances(D, sites, surveys, distance.type = "DSPD")

## ----load avoca, echo=T--------------------------------------------------
data("avoca")

## ----distance, echo=TRUE-------------------------------------------------
avoca_D_man = vegdiststruct(avoca_strat, method="manhattan", transform = function(x){log(x+1)})

## ----avoca_pcoa, echo=T, fig=TRUE, fig.height=6, fig.width=6, fig.align = "center"----
trajectoryPCoA(avoca_D_man,  avoca_sites, avoca_surveys,
               traj.colors = brewer.pal(8,"Accent"), 
               axes=c(1,2), length=0.1, lwd=2)
legend("topright", bty="n", legend = 1:8, col = brewer.pal(8,"Accent"), lwd=2)


## ----int1, echo=FALSE----------------------------------------------------
plotTrajDiamDist<-function(cli = 7) {
l = colnames(avoca_strat[[1]])
ncl = 14
m197072= avoca_strat[avoca_surveys==1][[cli]]["NOTCLI",2:ncl]
m197072[m197072<1] = NA
m1974 = avoca_strat[avoca_surveys==2][[cli]]["NOTCLI",2:ncl]
m1974[m1974<1] = NA
m1978 = avoca_strat[avoca_surveys==3][[cli]]["NOTCLI",2:ncl]
m1978[m1978<1] = NA
m1983 = avoca_strat[avoca_surveys==4][[cli]]["NOTCLI",2:ncl]
m1983[m1983<1] = NA
m1987 = avoca_strat[avoca_surveys==5][[cli]]["NOTCLI",2:ncl]
m1987[m1987<1] = NA
m1993 = avoca_strat[avoca_surveys==6][[cli]]["NOTCLI",2:ncl]
m1993[m1993<1] = NA
m1999 = avoca_strat[avoca_surveys==7][[cli]]["NOTCLI",2:ncl]
m1999[m1999<1] = NA
m2004 = avoca_strat[avoca_surveys==8][[cli]]["NOTCLI",2:ncl]
m2004[m2004<1] = NA
m2009 = avoca_strat[avoca_surveys==9][[cli]]["NOTCLI",2:ncl]
m2009[m2009<1] = NA


plot(m197072, type="l", ylim=c(1,200), log="y",
       xlab="", ylab="Number of individuals (log)", main=paste0("Trajectory ",cli), 
       axes=FALSE, col=gray(0.8), lwd=2)
axis(2, las=2)
axis(1, at=1:(ncl-1), labels=l[2:ncl], las=2)
lines(m1974, col=gray(0.7), lwd=2)
lines(m1978, col=gray(0.6), lwd=2)
lines(m1983, col=gray(0.5), lwd=2)
lines(m1987, col=gray(0.4), lwd=2)
lines(m1993, col=gray(0.3), lwd=2)
lines(m1999, col=gray(0.2), lwd=2)
lines(m2004, col=gray(0.1), lwd=2)
lines(m2009, col=gray(0), lwd=2)
legend("topright", bty="n", lwd=2,col=gray(seq(0.8,0, by=-0.1)), legend=c("1970/72","1974","1978","1983", "1987", "1993","1999","2004","2009"))
}

## ----trajectory_3, fig.height=4, fig.width=8, fig.align = "center"-------
par(mfrow=c(1,2))
trajectoryPCoA(avoca_D_man,  avoca_sites, avoca_surveys,
               selection= 3,
               length=0.1, lwd=2)
plotTrajDiamDist(3)

## ----trajectory_4, echo=T, fig.height=4, fig.width=8, fig.align = "center"----
par(mfrow=c(1,2))
trajectoryPCoA(avoca_D_man,  avoca_sites, avoca_surveys,
               selection= 4,
               length=0.1, lwd=2)
plotTrajDiamDist(4)

## ----trajectory lengths, echo=T------------------------------------------
trajectoryLengths(avoca_D_man, avoca_sites, avoca_surveys)

## ----trajectory angles, echo=T-------------------------------------------
trajectoryAngles(avoca_D_man, avoca_sites, avoca_surveys)

## ----trajectory directionality, echo=T-----------------------------------
trajectoryDirectionality(avoca_D_man, avoca_sites, avoca_surveys)

## ----avoca DT, echo=FALSE------------------------------------------------
avoca_D_traj_man = trajectoryDistances(avoca_D_man, avoca_sites, distance.type="DSPD", verbose=FALSE)
print(round(avoca_D_traj_man,3))

## ----avoca_DT_PCoA, echo=TRUE, fig = TRUE, fig.height=5, fig.width=6, fig.align="center"----
cmd_D2<-cmdscale(avoca_D_traj_man, add=TRUE, eig=TRUE, k=7)
x<-cmd_D2$points[,1]
y<-cmd_D2$points[,2]
plot(x,y, type="p", asp=1, xlab=paste0("PCoA 1 (", round(100*cmd_D2$eig[1]/sum(cmd_D2$eig)),"%)"), 
     ylab=paste0("PCoA 2 (", round(100*cmd_D2$eig[2]/sum(cmd_D2$eig)),"%)"), col="black",
     bg= brewer.pal(8,"Accent"), pch=21)
text(x,y, labels=1:8, pos=2)

## ------------------------------------------------------------------------
sites = rep(1,4)
surveys=1:4
spdata = rbind(c(35,30,20,15),
               c(50,25,15,10),
               c(65,20,10,5),
               c(80,15,5,0))

## ------------------------------------------------------------------------
D = vegan::vegdist(spdata, "bray")
D

## ---- echo=TRUE, fig = TRUE, fig.height=4, fig.width=6, fig.align="center"----
trajectoryPCoA(D,sites,surveys)

## ------------------------------------------------------------------------
trajectoryLengths(D,sites,surveys)
trajectoryAngles(D,sites,surveys)
trajectoryDirectionality(D,sites,surveys)

## ------------------------------------------------------------------------
sqrtD = sqrt(D)
sqrtD


## ---- echo=TRUE, fig = TRUE, fig.height=4, fig.width=6, fig.align="center"----
trajectoryPCoA(sqrtD,sites,surveys)

## ------------------------------------------------------------------------
trajectoryLengths(sqrtD,sites,surveys)
trajectoryAngles(sqrtD,sites,surveys)
trajectoryDirectionality(sqrtD,sites,surveys)

## ------------------------------------------------------------------------
Nsteps = 50
CC = 100
Nreplace <- CC*0.05

## ------------------------------------------------------------------------
x <- c(0, 1, 0, 67, 1, 3, 0, 2, 2, 2, 1, 6, 2, 0, 0, 2, 5, 1, 6, 0)
poffspring <- c(0, 0, 0.002, 0.661 ,0 ,0, 0.037, 0.281, 0, 0, 0, 0.008, 0, 0, 0.005, 0.003, 0, 0, 0, 0)

## ------------------------------------------------------------------------
m <- matrix(0, nrow=Nsteps+1, ncol=length(x))
m[1, ] = x
for(k in 1:Nsteps) {
  pdeath <-x/sum(x) #Equal probability of dying
  deaths<-rmultinom(1,Nreplace, pdeath)
  x <- pmax(x - deaths,0)
  offspring = rmultinom(1,Nreplace, as.vector(poffspring))
  x <- x + offspring
  m[k+1, ]<-x
}

## ------------------------------------------------------------------------
Sj <- seq(1,51, by=4) #Sample every four steps
mj <- m[Sj,]
surveys = 1:length(Sj)
sites = rep(1,length(Sj))

## ---- echo=TRUE, fig = TRUE, fig.height=5, fig.width=6, fig.align="center"----
D <- vegan::vegdist(mj,"bray")
trajectoryPCoA(D, sites, surveys, selection=1,length=0.1, axes=c(1,2))

## ---- echo=TRUE, fig = TRUE, fig.height=5, fig.width=6, fig.align="center"----
sqrtD = sqrt(D)
trajectoryPCoA(sqrtD, sites, surveys, selection=1,length=0.1, axes=c(1,2))

## ------------------------------------------------------------------------
trajectoryAngles(D,sites,surveys)
trajectoryAngles(sqrtD,sites,surveys)

## ------------------------------------------------------------------------
trajectoryDirectionality(D,sites,surveys)
trajectoryDirectionality(sqrtD,sites,surveys)

