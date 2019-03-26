library(lfstat)


### Name: createlfobj
### Title: Create an lfobj for further Low Flow Analysis
### Aliases: createlfobj createlfobj.default createlfobj.data.frame
###   createlfobj.ts createlfobj.lfobj
### Keywords: lfobj

### ** Examples

#Creating a lfobj from a timeseries
#Some sample data:

somevalues <- rexp(365)
#Convert to time series:
time <- ts(somevalues)

#Lets say our data contains values from one hydrological year (Oct-Sep)
#starting on 1. Oct. 1992:
myriver <- createlfobj(time, startdate = "01/10/1992",hyearstart = 10)
#Add meta-data
createlfobj(myriver, meta = list(river = "myriver"))



