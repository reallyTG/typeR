library(GWmodel)


### Name: gwr.multiscale
### Title: Multiscale GWR
### Aliases: gwr.multiscale gwr.psdm print.multiscalegwr gwr.backfit
###   bw.gwr2
### Keywords: multiscale, flexible bandwidth, parameter-specific distance
###   metrics, GWR

### ** Examples

data(LondonHP)
EUDM <- gw.dist(coordinates(londonhp))
#No bandwidth is selected, and bws0 values are used
## Not run: 
##D res1<- gwr.mutiscale(PURCHASE~FLOORSZ+PROF, data=londonhp, criterion="CVR",kernel="gaussian", 
##D adaptive=T, bws0=c(100, 100, 100),bw.seled=rep(T, 3), dMats=list(EUDM,EUDM,EUDM))
##D #FBGWR
##D res1<- gwr.mutiscale(PURCHASE~FLOORSZ+PROF, data=londonhp, criterion="dCVR",kernel="gaussian")
##D #Mixed GWR
##D res3<- gwr.mutiscale(PURCHASE~FLOORSZ+PROF, data=londonhp, bws0=c(Inf, 100, 100, Inf),
##D                bw.seled=rep(T, 3),kernel="gaussian", dMats=list(EUDM,EUDM,EUDM))
##D #PSDM GWR
##D res4<- gwr.mutiscale(PURCHASE~FLOORSZ+PROF, data=londonhp, kernel="gaussian", p.vals=c(1,2,3))
## End(Not run)



