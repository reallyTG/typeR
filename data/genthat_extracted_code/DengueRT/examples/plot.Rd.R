library(DengueRT)


### Name: plot
### Title: Plots for a visualization of the results
### Aliases: plot.dengue

### ** Examples

## Not run: 
##D ## (data example 1)
##D data("dengueoutbreak1")
##D 
##D ## plot function for a allmodels object 
##D ##Richards model 
##D ee<-allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time, model="Richards")
##D plot(ee,which=c(1,2))
##D 
##D ## (data example 2)
##D data("dengueoutbreak2")
##D ##using all built-in models 
##D ee2<-allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time, model="all")
##D plot(ee2,which=c(1,2,3,4))
##D 
##D ##plot function for allmodelpredict object
##D ##3P logistic model (Incidence data example 2)
##D ## information avalaible to the time point 20
##D ## observation to predict: 30 
##D ee3<-allmodelpredict(dengueoutbreak2$Incidence[1:20],dengueoutbreak2$Time[1:20],30, 
##D model="logistic3P")
##D plot(ee3,which=c(1,2))
##D 
##D ##using all built-in models (Incidence data example 2)
##D ## information avalaible to the time point 22
##D ## observation to predict: 30 
##D ee4<-allmodelpredict(dengueoutbreak2$Incidence[1:22],dengueoutbreak2$Time[1:22],30, 
##D model="all")
##D plot(ee4,which=c(1,2,3,4))
## End(Not run)

##plot function for changetimeFSTP object
## See example changetimeFSTP function 




