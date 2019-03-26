library(GWmodel)


### Name: gwr.basic
### Title: Basic GWR model
### Aliases: gwr.basic gw_reg gwr_diag Ci_mat F1234.test print.gwrm
### Keywords: basic, GWR

### ** Examples

data(LondonHP)
DM<-gw.dist(dp.locat=coordinates(londonhp))
##Compare the time consumed with and without a specified distance matrix
## Not run: 
##D system.time(gwr.res<-gwr.basic(PURCHASE~FLOORSZ, data=londonhp, bw=1000,
##D             kernel = "gaussian"))
##D system.time(DM<-gw.dist(dp.locat=coordinates(londonhp)))
##D system.time(gwr.res<-gwr.basic(PURCHASE~FLOORSZ, data=londonhp, bw=1000,
##D             kernel = "gaussian", dMat=DM))
##D 
##D ## specify an optimum bandwidth by cross-validation appraoch
##D bw1<-bw.gwr(PURCHASE~FLOORSZ, data=londonhp, kernel = "gaussian",dMat=DM)
##D gwr.res1<-gwr.basic(PURCHASE~FLOORSZ, data=londonhp, bw=bw1,kernel = "gaussian", 
##D                    dMat=DM)
##D gwr.res1 
## End(Not run)
data(LondonBorough)

nsa = list("SpatialPolygonsRescale", layout.north.arrow(), offset = c(561900,200900), 
scale = 500, col=1)
## Not run: 
##D if(require("RColorBrewer"))
##D {
##D   mypalette<-brewer.pal(6,"Spectral")
##D   x11()
##D   spplot(gwr.res1$SDF, "FLOORSZ", key.space = "right", cex=1.5, cuts=10,
##D   ylim=c(155840.8,200933.9), xlim=c(503568.2,561957.5),
##D   main="GWR estimated coefficients for FLOORSZ with a fixed bandwidth", 
##D   col.regions=mypalette, sp.layout=list(nsa, londonborough))}
## End(Not run)
## Not run: 
##D bw2<-bw.gwr(PURCHASE~FLOORSZ,approach="aic",adaptive=TRUE, data=londonhp, 
##D             kernel = "gaussian", dMat=DM)
##D gwr.res2<-gwr.basic(PURCHASE~FLOORSZ, data=londonhp, bw=bw2,adaptive=TRUE,
##D                     kernel = "gaussian", dMat=DM)
##D gwr.res2
##D if(require("RColorBrewer"))
##D {
##D   x11()
##D   spplot(gwr.res2$SDF, "FLOORSZ", key.space = "right", cex=1.5, cuts=10,
##D   ylim=c(155840.8,200933.9), xlim=c(503568.2,561957.5),
##D   main="GWR estimated coefficients for FLOORSZ with an adaptive bandwidth", 
##D   col.regions=mypalette, sp.layout=list(nsa,londonborough))}
## End(Not run)



