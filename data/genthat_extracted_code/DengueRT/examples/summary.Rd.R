library(DengueRT)


### Name: summary
### Title: Result summaries of the functions
### Aliases: summary.dengue

### ** Examples

## Not run: 
##D ## (data example 1)
##D data("dengueoutbreak1")
##D 
##D ## summary function for a allmodels object 
##D ##Richards model (Incidence data example 1)
##D ee<-allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time, model="Richards")
##D summary(ee)
##D 
##D ## (data example 2)
##D data("dengueoutbreak2")
##D ##using all built-in models (Incidence data example 2)
##D ee2<-allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time, model="all")
##D summary(ee2)
##D 
##D ##summary function for allmodelpredict object
##D ##3P logistic model (Incidence data example 2)
##D ## information avalaible to the time point 20
##D ## observation to predict: 30 
##D ee3<-allmodelpredict(dengueoutbreak2$Incidence[1:20],dengueoutbreak2$Time[1:20],30, 
##D model="logistic3P")
##D summary(ee3)
##D 
##D ##using all built-in models (Incidence data example 1)
##D ## information avalaible to the time point 22
##D ## observation to predict: 30 
##D ee4<-allmodelpredict(dengueoutbreak1$Incidence[1:22],dengueoutbreak1$Time[1:22],30, 
##D model="all")
##D summary(ee4)
## End(Not run)

##summary function for changetimeFSTP object
## See example changetimeFSTP function 






