library(eventInterval)


### Name: EIglm
### Title: Perform a GLM on times of events
### Aliases: EIglm
### Keywords: misc

### ** Examples

 ## Not run: 
##D   # Florida hurricane analysis (20th century)
##D   data(florida_hurr20)
##D   oldloc<-Sys.setlocale("LC_TIME", "C")
##D   fh_dates<-
##D    as.Date(paste(florida_hurr20$day,florida_hurr20$month,
##D    florida_hurr20$year,sep="-"),"%d-%B-%Y")
##D   fh_days<-as.numeric(fh_dates)
##D   fh_ints<-diff(fh_days)
##D   fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
##D   # run a Poisson analysis on the counts
##D   print(summary(glm(fh_counts~I(1900:1999),family="poisson")))
##D   EIglm(fh_days)
##D   data(florida_temp20)
##D   plot(florida_temp20$year,florida_temp20$Annual,type="b",
##D     main="Average temperature in Florida",xlab="Year",ylab="degrees F")
##D   lines(supsmu(florida_temp20$year,florida_temp20$Annual),lwd=2)
##D   # define a function to match values
##D   findval<-
##D    function(x,set) return(which(set %in% x))
##D   ftemp_years<-florida_temp20$Annual[unlist(sapply(florida_hurr20$year,
##D    FUN=findval,florida_temp20$year))]
##D   EIglm(fh_days,list(ft=ftemp_years[-1]))
##D   Sys.setlocale("LC_TIME", oldloc)
##D  
## End(Not run)
 # manually performing an event interval GLM
 # get the Florida hurricane data
 data(florida_hurr20)
 # create date values for the events
 florida_hurr20$date<-
  as.Date(paste(florida_hurr20$day,florida_hurr20$month,
  florida_hurr20$year,sep="-"),"%d-%B-%Y")
 # convert the dates to numeric values (offsets from 1/1/1970)
 florida_hurr20$days<-as.numeric(florida_hurr20$date)
 # calculate the intervals, adding NA for the first unknown value
 florida_hurr20$ints<-c(NA,diff(florida_hurr20$days))
 # first test the default model in EIglm, dropping the first event
 summary(glm(ints~days,florida_hurr20[-1,],family="Gamma"))
 # test a model predicting intervals with times of occurrence,
 # the intensities of the hurricanes and their interaction,
 # again dropping the first event
 summary(glm(ints~days*category,florida_hurr20[-1,],family="Gamma"))



