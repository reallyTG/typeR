library(FLightR)


### Name: plot_slopes_by_location
### Title: plots log of observed versus expected slope by time for a known
###   location
### Aliases: plot_slopes_by_location

### ** Examples

File<-system.file("extdata", "Godwit_TAGS_format.csv", package = "FLightR")
Proc.data<-get.tags.data(File)
plot_slopes_by_location(Proc.data=Proc.data, location=c(5.43, 52.93))
abline(v=as.POSIXct("2013-08-20")) # end of first calibration period
abline(v=as.POSIXct("2014-05-05")) # start of the second calibration period




