library(seas)


### Name: plot.interarrival
### Title: Plot interarrivals for precipitation
### Aliases: plot.interarrival
### Keywords: hplot

### ** Examples

data(mscdata)

dat.int <- interarrival(mksub(mscdata, id=1108447))
plot(dat.int, width="mon")

plot(dat.int, ylog=FALSE, maxy=35, rep=10)



