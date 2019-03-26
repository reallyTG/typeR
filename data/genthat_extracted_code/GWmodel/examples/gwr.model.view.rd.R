library(GWmodel)


### Name: gwr.model.view
### Title: Visualise the GWR models from 'gwr.model.selection'
### Aliases: gwr.model.view model.view.gwr
### Keywords: model selection, view, visualization

### ** Examples

## Not run: 
##D data(LondonHP)
##D DM<-gw.dist(dp.locat=coordinates(londonhp))
##D DeVar<-"PURCHASE"
##D InDeVars<-c("FLOORSZ","GARAGE1","BLDPWW1","BLDPOSTW")
##D model.sel<-gwr.model.selection(DeVar,InDeVars, data=londonhp,
##D kernel = "gaussian", dMat=DM,bw=5000)
##D model.list<-model.sel[[1]]
##D gwr.model.view(DeVar, InDeVars, model.list=model.list)
## End(Not run)



