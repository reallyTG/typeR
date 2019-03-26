library(GWmodel)


### Name: gwr.robust
### Title: Robust GWR model
### Aliases: gwr.robust
### Keywords: robust, GWR

### ** Examples

## Not run: 
##D data(DubVoter)
##D bw.a <- bw.gwr(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64,
##D data=Dub.voter,approach="AICc",kernel="bisquare",adaptive=TRUE)
##D bw.a
##D gwr.res <- gwr.basic(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64,
##D data=Dub.voter,bw=bw.a,kernel="bisquare",adaptive=TRUE,F123.test=TRUE)
##D print(gwr.res)
##D 
##D # Map of the estimated coefficients for LowEduc
##D names(gwr.res$SDF)
##D if(require("RColorBrewer"))
##D {
##D   mypalette<-brewer.pal(6,"Spectral")
##D   X11(width=10,height=12)
##D   spplot(gwr.res$SDF,"LowEduc",key.space = "right",
##D   col.regions=mypalette,at=c(-8,-6,-4,-2,0,2,4),
##D   main="Basic GW regression coefficient estimates for LowEduc")
##D }
##D # Robust GW regression and map of the estimated coefficients for LowEduc
##D rgwr.res <- gwr.robust(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64, data=Dub.voter,bw=bw.a,kernel="bisquare",
##D adaptive=TRUE,F123.test=TRUE)
##D print(rgwr.res)
##D if(require("RColorBrewer"))
##D {
##D   X11(width=10,height=12)
##D   spplot(rgwr.res$SDF, "LowEduc", key.space = "right",
##D   col.regions=mypalette,at=c(-8,-6,-4,-2,0,2,4),
##D   main="Robust GW regression coefficient estimates for LowEduc")
##D }
## End(Not run)



