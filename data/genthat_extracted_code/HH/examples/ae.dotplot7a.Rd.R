library(HH)


### Name: AEdotplot
### Title: AE (Adverse Events) dotplot of incidence and relative risk
### Aliases: AEdotplot AEdotplot.formula
### Keywords: hplot htest shiny

### ** Examples

## formula method.  See ?AEdotplot.data.frame for other methods.
data(AEdata)
head(AEdata)

AEdotplot(AE ~ nAE/nTRT, groups = TRT, data = AEdata)           ## sort by Relative Risk
AEdotplot(AE ~ nAE/nTRT | OrgSys, groups = TRT, data = AEdata)  ## conditioned on Organ System

## Not run: 
##D AEdotplot(AE ~ nAE/nTRT, groups = TRT, data = AEdata, sortbyVar="PCT")                   ## PCT A
##D AEdotplot(AE ~ nAE/nTRT, groups = TRT, data = AEdata, sortbyVar="PCT", sortbyVarBegin=2) ## PCT B
##D AEdotplot(AE ~ nAE/nTRT, groups = TRT, data = AEdata, sortbyRelativeRisk=FALSE)     ## levels(AE)
##D AEdotplot(AE ~ nAE/nTRT | OrgSys, groups = TRT, data = AEdata, sortbyVar="ase.logrelrisk")
## End(Not run)


## Not run: 
##D 
##D 
##D AEdotplot(AE ~ nAE/nTRT | OrgSys, groups = TRT,
##D           data = AEdata[c(AEdata$OrgSys %in% c("GI","Resp")),])
##D 
##D ## test sortbyRelativeRisk=FALSE
##D ABCD.12345 <- AEdata[1:12,]
##D head(ABCD.12345)
##D AEdotplot(AE ~ nAE/nTRT | OrgSys, groups=TRT, data=ABCD.12345)
##D AEdotplot(AE ~ nAE/nTRT | OrgSys, groups=TRT, data=ABCD.12345, sort=FALSE)
##D 
##D ## suppress third panel
##D tmp <- AEdotplot(AE ~ nAE/nTRT, groups = TRT, data = AEdata)
##D print(tmp, AEtable=FALSE)
## End(Not run)

## Not run: 
##D   ## run the shiny app
##D   shiny::runApp(system.file("shiny/AEdotplot", package="HH"))
## End(Not run)




