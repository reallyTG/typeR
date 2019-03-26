library(seas)


### Name: plot.seas.norm
### Title: Plot seasonal normal of a variable, including precipitation
###   normals
### Aliases: plot.seas.norm plot.precip.norm
### Keywords: hplot

### ** Examples

data(mscdata)
dat <- mksub(mscdata, id=1108447)
d.ss <- seas.sum(dat)
plot(seas.norm(d.ss))
plot(precip.norm(d.ss, fun=median))
plot(precip.norm(d.ss, fun=mean))
plot(precip.norm(d.ss, fun=mean, norm="active"))
plot(precip.norm(d.ss, fun=median, norm="active"))
plot(precip.norm(d.ss), start=15, rep=12)
mar <- par("mar")
plot(precip.norm(d.ss), add.alt=TRUE)

par(mar=mar)
d2.ss <- seas.sum(dat, start.day=as.Date("2000-08-01"))
plot(precip.norm(d2.ss, fun="mean"))



