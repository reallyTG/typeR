library(georob)


### Name: predict.georob
### Title: Predict Method for Robustly Fitted Spatial Linear Models
### Aliases: predict.georob control.predict.georob
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D data(meuse)
##D 
##D data(meuse.grid)
##D coordinates(meuse.grid) <- ~x+y
##D meuse.grid.pixdf <- meuse.grid
##D gridded(meuse.grid.pixdf) <- TRUE
##D   
##D library(constrainedKriging)
##D data(meuse.blocks)
##D 
##D r.logzn.rob <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp", param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1., control = control.georob(cov.bhat = TRUE, full.cov.bhat = TRUE))
##D         
##D ## point predictions of log(Zn)
##D r.pred.points <- predict(r.logzn.rob, newdata = meuse.grid.pixdf, 
##D     control = control.predict.georob(extended.output = TRUE, full.covmat = TRUE))
##D str(r.pred.points$pred@data)
##D 
##D ## back-transformation of point predictions
##D r.backtf.pred.points <- lgnpp(r.pred.points)
##D str(r.pred.points$pred@data)
##D 
##D spplot(r.backtf.pred.points[["pred"]], zcol = "lgn.pred", main = "Zn content")
##D 
##D ## predicting mean Zn content for whole area
##D r.block <- lgnpp(r.pred.points, is.block = TRUE, all.pred = r.backtf.pred.points[["pred"]])
##D r.block
##D 
##D ## block predictions of log(Zn)
##D r.pred.block <- predict(r.logzn.rob, newdata = meuse.blocks, 
##D     control = control.predict.georob(extended.output = TRUE,
##D         pwidth = 75, pheight = 75))
##D r.backtf.pred.block <- lgnpp(r.pred.block, newdata = meuse.grid)
##D 
##D spplot(r.backtf.pred.block, zcol = "lgn.pred", main = "block means Zn content")
## End(Not run)




