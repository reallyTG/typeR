library(seas)


### Name: interarrival
### Title: Calculate the interarrivals between and within precipitation
###   events
### Aliases: interarrival
### Keywords: datagen ts

### ** Examples

data(mscdata)

van.int <- interarrival(mksub(mscdata, id=1108447))
summary(van.int)
van.int[which.max(van.int$dry),]
van.int[which.max(van.int$wet),]

plot(van.int, ylog=FALSE, maxy=30)



