library(highfrequency)


### Name: refreshTime
### Title: Synchronize (multiple) irregular timeseries by refresh time
### Aliases: refreshTime
### Keywords: data manipulation

### ** Examples

#suppose irregular timepoints:
start = as.POSIXct("2010-01-01 09:30:00")
ta = start + c(1,2,4,5,9);    	
tb = start + c(1,3,6,7,8,9,10,11);

#yielding the following timeseries:
a = as.xts(1:length(ta),order.by=ta);
b = as.xts(1:length(tb),order.by=tb);

#Calculate the synchronized timeseries:
refreshTime(list(a,b))



