library(GWmodel)


### Name: gwr.predict
### Title: GWR used as a spatial predictor
### Aliases: gwr.predict gw.reg1 print.gwrm.pred
### Keywords: GWR, prediction

### ** Examples

## Not run: 
##D data(LondonHP)
##D gwr.pred<-gwr.predict(PURCHASE~FLOORSZ, data=londonhp, bw=2000,kernel = "gaussian")
##D gwr.pred
##D #########Global OLS regression results and comparison with gstat functions
##D if(require("gstat"))
##D {
##D   mlr.g <- gstat(id = "xx1", formula = PURCHASE~FLOORSZ,data=londonhp)
##D   mlr.g1 <- predict(mlr.g, newdata = londonhp, BLUE = TRUE)
##D   mlr.g1
##D }
##D ############
##D ols.pred<-gwr.predict(PURCHASE~FLOORSZ, data=londonhp, bw=100000000000000000000000)
##D ols.pred$SDF
## End(Not run)



