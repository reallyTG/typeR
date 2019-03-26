library(car)


### Name: scatter3d
### Title: Three-Dimensional Scatterplots and Point Identification
### Aliases: scatter3d scatter3d.formula scatter3d.default Identify3d
### Keywords: hplot

### ** Examples

    if(interactive() && require(rgl) && require(mgcv)){
scatter3d(prestige ~ income + education, data=Duncan, id=list(n=3))
Sys.sleep(5) # wait 5 seconds
scatter3d(prestige ~ income + education | type, data=Duncan)
Sys.sleep(5)
scatter3d(prestige ~ income + education | type, surface=FALSE,
	ellipsoid=TRUE, revolutions=3, data=Duncan)
scatter3d(prestige ~ income + education, fit=c("linear", "additive"),
	data=Prestige)
Sys.sleep(5)
scatter3d(prestige ~ income + education | type,
    radius=(1 + women)^(1/3), data=Prestige)
	}
	## Not run: 
##D # drag right mouse button to identify points, click right button in open area to exit
##D scatter3d(prestige ~ income + education, data=Duncan, id=list(method="identify"))
##D scatter3d(prestige ~ income + education | type, data=Duncan, id=list(method="identify"))
##D     
## End(Not run)



