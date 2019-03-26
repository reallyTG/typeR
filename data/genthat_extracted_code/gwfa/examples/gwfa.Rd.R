library(gwfa)


### Name: gwfa
### Title: Geographically Weighted Fractal Analysis
### Aliases: gwfa

### ** Examples

## Not run: 
##D data("guadeloupe")
##D 
##D test=gwfa(points=guadeloupe,q=0,radius=(20*2^((0:6)/2)),
##D bandwith=1600,sample_size=3000,cell_size=2000)
##D test=test[test$count>100,]#select the cells with at least 100 points. 
##D 
##D 
##D #estimate the fractal dimension on the 7 radius
##D X=cbind(rep(1,length(test@radius)),log2(test@radius))
##D fit_frac_dim=(do.call(cbind,test[,4:10]))%*%t(solve(t(X)%*%X)%*%t(X))
##D test$dimfrac=fit_frac_dim[,2]
##D 
##D #create spatial polygon dataframe
##D shp=grid_to_spdf(test,"2970")
##D 
##D #convert to geographic information systems software format 
##D library(rgdal)
##D writeOGR(shp,"guade_analysis.shp","guade_analysis",driver="ESRI Shapefile",overwrite_layer = T)
##D 
##D #use the cartography package
##D library(cartography)
##D choroLayer(spdf=shp,nclass=5,var="dimfrac",method="fisher-jenks")
## End(Not run)


