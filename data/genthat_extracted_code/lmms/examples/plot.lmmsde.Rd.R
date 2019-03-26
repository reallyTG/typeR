library(lmms)


### Name: plot.lmmsde
### Title: Plot of 'lmmsde' objects
### Aliases: plot.lmmsde

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D lmmsDEtestl1 <-lmmsDE(data=kidneySimTimeGroup$data,time=kidneySimTimeGroup$time,
##D                 sampleID=kidneySimTimeGroup$sampleID,
##D                 group=kidneySimTimeGroup$group,
##D                 experiment="longitudinal1",basis="p-spline",keepModels=T) 
##D plot(lmmsDEtestl1,y=2,type="all")
##D plot(lmmsDEtestl1,y=2,type="time")
##D plot(lmmsDEtestl1,y=2,type="group")
##D plot(lmmsDEtestl1,y=2,type="group*time",smooth=TRUE)
##D 
##D #to save memory do not keep the models
##D lmmsDEtestl1 <-lmmsDE(data=kidneySimTimeGroup$data,time=kidneySimTimeGroup$time,
##D                 sampleID=kidneySimTimeGroup$sampleID,
##D                 group=kidneySimTimeGroup$group,
##D                 experiment="longitudinal1",basis="p-spline",keepModels=F) 
##D # just the fitted trajectory                 
##D plot(lmmsDEtestl1,y=2,type="all")
##D 
##D plot(lmmsDEtestl1,y=2,type="all",data=kidneySimTimeGroup$data,time=kidneySimTimeGroup$time,
##D group=kidneySimTimeGroup$group)
## End(Not run)  



