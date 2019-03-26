library(DengueRT)


### Name: changetimeFSTP
### Title: Changes over time of the final size and turning point estimates
###   for each built-in model and model averaged.
### Aliases: changetimeFSTP

### ** Examples

## Not run: 
##D ## (data example 2)
##D data("dengueoutbreak2")
##D 
##D ##Time point from which is required to see the changes over time 
##D ##of the final size and turning point estimates:20
##D 
##D t2<-changetimeFSTP(dengueoutbreak2$Incidence,dengueoutbreak2$Time,20)
##D 
##D ##summary function for changetimeFSTP object
##D summary(t2)
##D 
##D ## plot function for changetimeFSTP object 
##D plot(t2,which=c(5,6))
## End(Not run)



