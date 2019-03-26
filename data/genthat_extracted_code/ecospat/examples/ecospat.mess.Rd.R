library(ecospat)


### Name: ecospat.mess
### Title: MESS
### Aliases: ecospat.mess

### ** Examples

x <- ecospat.testData[c(2,3,4:8)]
proj <- x[1:90,] #A projection dataset.
cal <- x[91:300,] #A calibration dataset

#Create a MESS object 
mess.object <- ecospat.mess (proj, cal, w="default")

#Plot MESS 
ecospat.plot.mess (mess.object, cex=1, pch=15)



