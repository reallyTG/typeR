library(FLightR)


### Name: find.stationary.location
### Title: find unknown calibration location
### Aliases: find.stationary.location

### ** Examples

#this example takes about 15 minutes to run
## Not run: 
##D File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
##D Proc.data<-get.tags.data(File)
##D plot_slopes_by_location(Proc.data=Proc.data, location=c(5.43, 52.93))
##D abline(v=as.POSIXct("2013-08-20")) # end of first calibration period
##D abline(v=as.POSIXct("2014-05-05")) # start of the second calibration period
##D Location<-find.stationary.location(Proc.data, '2013-07-20', '2013-08-20', initial.coords=c(10, 50))
## End(Not run)



