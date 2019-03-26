library(mads)


### Name: execute.multi.analysis
### Title: Performs Multiple Analyses on Distance Data
### Aliases: execute.multi.analysis
### Keywords: covariate model sampling, sightings, uncertainty uncertainty,
###   unidentified ~distance

### ** Examples

## Not run: 
##D 
##D ex.filename<-system.file("testData/input_checks/ddf_dat.robj", package="mads")
##D load(ex.filename)
##D ex.filename<-system.file("testData/input_checks/obs_table.robj", package="mads")
##D load(ex.filename)
##D ex.filename<-system.file("testData/input_checks/region_table.robj", package="mads")
##D load(ex.filename)
##D ex.filename<-system.file("testData/input_checks/sample_table.robj", package="mads")
##D load(ex.filename)
##D 
##D #run ddf analyses
##D ddf.1 <- ddf(dsmodel = ~mcds(key = "hn", formula = ~ size),
##D              method='ds', data=ddf.dat,meta.data=list(width=4))
##D ddf.2 <- ddf(dsmodel = ~mcds(key = "hr", formula = ~ size),
##D              method='ds', data=ddf.dat,meta.data=list(width=4))
##D 
##D model.names <- list("CD"=c("ddf.1","ddf.2"), "WD"=c("ddf.1","ddf.2"),
##D                    "UnidDol"=c("ddf.1","ddf.2"))
##D ddf.models  <- list("ddf.1" = ddf.1, "ddf.2" = ddf.2)
##D 
##D unidentified.code.definitions <- list("UnidDol" = c("CD","WD"))
##D bootstrap.options             <- list(resample="samples", n=10, quantile.type = 7)
##D 
##D results<- execute.multi.analysis(
##D              species.code = names(model.names),
##D              unidentified.sightings = unidentified.code.definitions,
##D              models.by.species.code = model.names,
##D              ddf.model.objects = ddf.models,
##D              ddf.model.options = list(criterion="AIC"),
##D              region.table = region.table,
##D              sample.table = sample.table,
##D              obs.table = obs.table,
##D              bootstrap = TRUE,
##D              bootstrap.option = bootstrap.options)
##D 
## End(Not run)



