library(GWmodel)


### Name: gwr.bootstrap
### Title: Bootstrap GWR
### Aliases: gwr.bootstrap print.gwrbsm generate.lm.data parametric.bs
###   parametric.bs.local se.bs bias.bs ci.bs pval.bs gwrtvar gwrt.mlr
###   gwrt.lag gwrt.err gwrt.sma bw.gwr3
### Keywords: multi-scale, flexible bandwidth, parameter-specific distance
###   metrics, GWR

### ** Examples

## Not run: 
##D #Example with the Georgia educational attainment data
##D data(Georgia)
##D data(GeorgiaCounties)
##D coords <- cbind(Gedu.df$X, Gedu.df$Y)
##D Gedu.spdf <- SpatialPointsDataFrame(coords, Gedu.df)
##D #Make a SpatialPolygonDataFrame
##D require(RColorBrewer)
##D gSRDF <- SpatialPolygonsDataFrame(polygons(Gedu.counties), over(Gedu.counties, 
##D                                   Gedu.spdf),match.ID=T)  
##D mypalette.1 <- brewer.pal(11,"Spectral")
##D X11(width=9,height=8)                   
##D spplot(gSRDF, names(gSRDF)[c(5,7:9)], col.regions=mypalette.1,
##D cuts=10, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Georgia educational attainment predictor data")))
##D bsm.res <- gwr.bootstrap(PctBach~PctRural+PctEld+PctFB+PctPov, gSRDF, 
##D                          R=999, longlat=T)
##D bsm.res
##D #local bootstrap tests with respect to: MLR, ERR, SMA and LAG models.
##D mypalette.local.test <- brewer.pal(10,"Spectral")
##D X11(width=12,height=16)
##D spplot(bsm.res$SDF, names(bsm.res$SDF)[14:17], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the MLR model 
##D                        null hypothesis")))
##D 
##D X11(width=12,height=16)
##D spplot(bsm.res$SDF, names(bsm.res$SDF)[19:22], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the ERR model 
##D                        null hypothesis")))
##D X11(width=12,height=16)
##D spplot(bsm.res$SDF, names(bsm.res$SDF)[24:27], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the SMA model null
##D                        hypothesis")))
##D 
##D X11(width=12,height=16)
##D spplot(bsm.res$SDF, names(bsm.res$SDF)[29:32], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the LAG model null
##D                        hypothesis")))
##D ################################################################################
##D #Example with Dublin voter data
##D data(DubVoter)
##D X11(width=9,height=8)                   
##D spplot(Dub.voter, names(Dub.voter)[c(5,7,9,10)], col.regions=mypalette.1,
##D cuts=10, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Dublin voter turnout predictor data")))
##D bsm.res1 <- gwr.bootstrap(GenEl2004~LARent+Unempl+Age18_24+Age25_44, Dub.voter
##D                          , R=999)
##D bsm.res1
##D 
##D #local bootstrap tests with respect to: MLR, ERR, SMA and LAG models.
##D X11(width=11,height=8)
##D spplot(bsm.res1$SDF, names(bsm.res1$SDF)[14:17], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the MLR model null
##D                         hypothesis")))
##D X11(width=11,height=8)
##D spplot(bsm.res1$SDF, names(bsm.res1$SDF)[19:22], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the ERR model null
##D                         hypothesis")))
##D X11(width=11,height=8)
##D spplot(bsm.res1$SDF, names(bsm.res1$SDF)[24:27], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the SMA model 
##D                             null hypothesis")))
##D X11(width=11,height=8)
##D spplot(bsm.res1$SDF, names(bsm.res1$SDF)[29:32], col.regions=mypalette.local.test,
##D cuts=9, par.settings=list(fontsize=list(text=15)),
##D main=expression(paste("Local p-values for each coefficient of the LAG model 
##D                             null hypothesis")))
## End(Not run)



