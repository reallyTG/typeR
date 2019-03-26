library(BIFIEsurvey)


### Name: data.pisaNLD
### Title: Some PISA Datasets
### Aliases: data.pisaNLD
### Keywords: datasets

### ** Examples

## Not run: 
##D library(mitools)
##D library(survey)
##D library(intsvy)
##D 
##D #############################################################################
##D # EXAMPLE 1: Dutch PISA 2006 dataset
##D #############################################################################
##D 
##D data(data.pisaNLD)
##D data <- data.pisaNLD
##D 
##D #--- Create object of class BIFIEdata
##D 
##D # list variables with plausible values: These must be named
##D # as pv1math, pv2math, ..., pv5math, ...
##D pv_vars <- toupper( c("math", "math1", "math2", "math3", "math4",
##D              "read", "scie", "prob") )
##D # create 5 datasets including different sets of plausible values
##D dfr <- NULL
##D VV <- length(pv_vars)
##D Nimp <- 5           # number of plausible values
##D for (vv in 1:VV){
##D       vv1 <- pv_vars[vv]
##D       ind.vv1 <- which( colnames(data) %in% paste0("PV", 1:Nimp, vv1) )
##D       dfr2 <- data.frame( "variable"=paste0("PV", vv1), "var_index"=vv,
##D           "data_index"=ind.vv1, "impdata_index"=1:Nimp )
##D       dfr <- rbind( dfr, dfr2 )
##D }
##D 
##D sel_ind <- setdiff( 1:( ncol(data) ), dfr$data_index )
##D data0 <- data[, sel_ind ]
##D V0 <- ncol(data0)
##D newvars <- seq( V0+1, V0+VV )
##D datalist <- as.list( 1:Nimp )
##D for (ii in 1:Nimp ){
##D     dat1 <- data.frame( data0, data[, dfr[ dfr$impdata_index==ii, "data_index" ]])
##D     colnames(dat1)[ newvars ] <- paste0("PV",pv_vars)
##D     datalist[[ii]] <- dat1
##D }
##D 
##D # dataset with replicate weights
##D datarep <- data[, grep( "W_FSTR", colnames(data) ) ]
##D RR <- ncol(datarep)     # number of replicate weights
##D 
##D # create BIFIE object
##D bifieobj <- BIFIEsurvey::BIFIE.data( datalist, wgt=data[, "W_FSTUWT"],
##D                  wgtrep=datarep, fayfac=1 / RR / ( 1 - .5 )^2 )
##D # For PISA: RR=80 and therefore fayfac=1/20=.05
##D summary(bifieobj)
##D 
##D #--- Create BIFIEdata object immediately using BIFIE.data.jack function
##D bifieobj1 <- BIFIEsurvey::BIFIE.data.jack( data.pisaNLD, jktype="RW_PISA", cdata=TRUE)
##D summary(bifieobj1)
##D 
##D #--- Create object in survey package
##D datL <- mitools::imputationList(list( datalist[[1]],datalist[[2]],
##D                   datalist[[3]],datalist[[4]],datalist[[5]]) )
##D pisades <- survey::svrepdesign(ids=~ 1, weights=~W_FSTUWT, data=datL,
##D                     repweights="W_FSTR[0-9]+", type="Fay", rho=0.5, mse=TRUE)
##D print(pisades)
##D 
##D #++++++++++++++ some comparisons with other packages +++++++++++++++++++++++++++++++
##D 
##D #**** Model 1: Means for mathematics and reading
##D # BIFIEsurvey package
##D mod1a <- BIFIEsurvey::BIFIE.univar( bifieobj, vars=c("PVMATH", "PVREAD") )
##D summary(mod1a)
##D 
##D # intsvy package
##D mod1b <- intsvy::pisa.mean.pv(pvlabel="MATH", data=data.pisaNLD )
##D mod1b
##D 
##D # survey package
##D mod1c <- with( pisades, survey::svymean(PVMATH~1, design=pisades) )
##D res1c <- mitools::MIcombine(mod1c)
##D summary(res1c)
##D 
##D #**** Model 2: Linear regression
##D # BIFIEsurvey package
##D mod2a <- BIFIEsurvey::BIFIE.linreg( bifieobj, dep="PVMATH",
##D               pre=c("one","ANXMAT","HISEI"))
##D summary(mod2a)
##D 
##D # intsvy package
##D mod2b <- intsvy::pisa.reg.pv(pvlabel="MATH", x=c("ANXMAT","HISEI"), data=data.pisaNLD)
##D mod2b
##D 
##D # survey package
##D mod2c <- with( pisades, survey::svyglm(PVMATH~ANXMAT+HISEI, design=pisades) )
##D res2c <- mitools::MIcombine(mod2c)
##D summary(res2c)
## End(Not run)



