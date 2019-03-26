library(eventInterval)


### Name: EIdist
### Title: Plot the empirical and exponential distributions of values
### Aliases: EIdist
### Keywords: misc

### ** Examples

 ## Not run: 
##D   # won't pass check due to the call to fitdistr
##D   data(florida_hurr20)
##D   oldloc<-Sys.setlocale("LC_TIME", "C")
##D   fh_dates<-
##D    as.Date(paste(florida_hurr20$day,florida_hurr20$month,
##D    florida_hurr20$year,sep="-"),"%d-%B-%Y")
##D   fh_days<-as.numeric(fh_dates)
##D   fh_ints<-diff(fh_days)
##D   fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
##D   require(MASS)
##D   EIdist(fh_days,main="Empirical distribution of hurricanes",
##D    xlab="Intervals in days",ylab="Frequencies")
##D   Sys.setlocale("LC_TIME", oldloc)
##D  
## End(Not run)



