library(GSIF)


### Name: makeGstatCmd
### Title: Make a gstat command script
### Aliases: makeGstatCmd
### Keywords: methods

### ** Examples

## Not run: 
##D library(sp)
##D library(gstat)
##D 
##D # Meuse data:
##D demo(meuse, echo=FALSE)
##D # fit a model:
##D omm <- fit.gstatModel(observations = meuse, formulaString = om~dist, 
##D   family = gaussian(log), covariates = meuse.grid)
##D str(omm@vgmModel)
##D # write the regression matrix to GeoEAS:
##D meuse$log_om <- log1p(meuse$om)
##D write.data(obj=meuse, covariates=meuse.grid["dist"], 
##D     outfile="meuse.eas", methodid="log_om")
##D writeGDAL(meuse.grid["dist"], "dist.rst", drivername="RST", mvFlag="-99999")
##D makeGstatCmd(log_om~dist, vgmModel=omm@vgmModel, 
##D     outfile="meuse_om_sims.cmd", easfile="meuse.eas", 
##D     nsim=50, nmin=20, nmax=40, radius=1500)
##D # compare the processing times:
##D system.time(system("gstat meuse_om_sims.cmd"))
##D vgmModel = omm@vgmModel
##D class(vgmModel) <- c("variogramModel", "data.frame")
##D system.time(om.rk <- krige(log_om~dist, meuse[!is.na(meuse$log_om),], 
##D     meuse.grid, nmin=20, nmax=40, model=vgmModel, nsim=50))
## End(Not run)



