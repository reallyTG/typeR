library(eventInterval)


### Name: EIplot
### Title: Plot the intervals between times against the times
### Aliases: EIplot
### Keywords: misc

### ** Examples

 # Florida hurricane analysis (20th century)
 data(florida_hurr20)
 oldloc<-Sys.setlocale("LC_TIME", "C")
 fh_dates<-
  as.Date(paste(florida_hurr20$day,florida_hurr20$month,
  florida_hurr20$year,sep="-"),"%d-%B-%Y")
 fh_days<-as.numeric(fh_dates)
 fh_ints<-diff(fh_days)
 fh_counts<-tabulate(florida_hurr20$year[-1]-1899,nbins=100)
 EIplot(fh_days,main="Florida hurricanes, 1900-1999",
  xlab="Year",ylab="Interval between hurricanes (days)",
  xaxticks=as.Date(as.character(seq(1900,2000,by=20)),"%Y"),
  xaxlabs=seq(1900,2000,by=20))
 Sys.setlocale("LC_TIME", oldloc)



