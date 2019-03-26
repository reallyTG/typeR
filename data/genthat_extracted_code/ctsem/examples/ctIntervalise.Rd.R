library(ctsem)


### Name: ctIntervalise
### Title: Converts absolute times to intervals for wide format ctsem panel
###   data
### Aliases: ctIntervalise

### ** Examples

#First load the long format data with absolute times
data('longexample')

#Then convert to wide format
wideexample <- ctLongToWide(datalong = longexample, id = "id", 
time = "time", manifestNames = c("Y1", "Y2", "Y3"), 
TDpredNames = "TD1", TIpredNames = c("TI1", "TI2"))

#Then convert the absolute times to intervals, using the Tpoints reported from the prior step.
wide <- ctIntervalise(datawide = wideexample, Tpoints = 4, n.manifest = 3, 
n.TDpred = 1, n.TIpred = 2, manifestNames = c("Y1", "Y2", "Y3"), 
TDpredNames = "TD1", TIpredNames = c("TI1", "TI2") )
 
print(wide)



