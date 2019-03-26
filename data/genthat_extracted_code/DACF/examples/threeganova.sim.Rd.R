library(DACF)


### Name: threeganova.sim
### Title: threeganova.sim
### Aliases: threeganova.sim

### ** Examples

sample.3g=threeganova.sim(1000,.16,5) #data of n=1000, sd1=sd3=1 and sd2=5, and f^2=.16
colnames(sample.3g) #examine the column names
dim(sample.3g) #examine the data structure
aggregate(sample.3g$y,sd,by=list(sample.3g$group)) #check group standard deviations



