library(lfstat)


### Name: seasratio
### Title: Seasonality Ratio
### Aliases: seasratio

### ** Examples

data(ngaruroro)
#Start of the hydrological year (01/12) is taken as second breakday
seasratio(ngaruroro, breakdays = "01/07")

#Two breakdays
seasratio(ngaruroro, breakdays = c("01/03","01/09"))



