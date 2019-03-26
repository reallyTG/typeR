library(spaMM)


### Name: seaMask
### Title: Masks of seas or lands
### Aliases: seaMask oceanmask landMask worldcountries
### Keywords: datasets

### ** Examples

if (spaMM.getOption("example_maxtime")>1.1) {

data("seaMask")
## plot of predictions of behaviour for a land bird:
if (requireNamespace("maps")){
 data("blackcap")
 bfit <- corrHLfit(migStatus ~ means+ Matern(1|longitude+latitude),data=blackcap,
                  HLmethod="ML",
                  ranFix=list(lambda=0.5537,phi=1.376e-05,rho=0.0544740,nu=0.6286311))
 ## We add small masks to the points on small islands to see the predictions there
 ll <- blackcap[,c("longitude","latitude")]
 pointmask <- function(xy,r=1,npts=12) {
  theta <- 2*pi/npts *seq(npts)
  hexas <- lapply(seq(nrow(xy)), function(li){
    p <- as.numeric(xy[li,])
    hexa <- cbind(x=p[1]+r*cos(theta),y=p[2]+r*sin(theta))
    rbind(rep(NA,2),hexa) ## inital NA before each polygon
  })
  do.call(rbind,hexas)
 }
 pmasks <- pointmask(ll[c(2,4,5,6,7),],r=0.8) ## small islands only
 filled.mapMM(bfit,add.map=TRUE,
             plot.title=title(main="Inferred migration propensity of blackcaps",
                               xlab="longitude",ylab="latitude"),
             decorations=quote(points(pred[,coordinates],cex=1,pch="+")),
             plot.axes=quote({axis(1);axis(2);
                        polypath(rbind(seaMask,pmasks),border=FALSE,
                                 col="grey", rule="evenodd")
             }))
}
}

## Not run: 
##D # All shape files can be found here: http://www.naturalearthdata.com/downloads/
##D # Once downloaded, they can be loaded into R by
##D if (requireNamespace("rgdal", quietly = TRUE)) {
##D   worldcountries <- readOGR("ne_110m_admin_0_countries_lakes.shp",
##D                            layer="ne_110m_admin_0_countries_lakes")
##D }
## End(Not run)



