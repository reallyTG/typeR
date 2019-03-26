library(seas)


### Name: plot.seas.sum
### Title: Plot boxplots of normalized seasonal sums
### Aliases: plot.seas.sum plot.precip.sum
### Keywords: hplot

### ** Examples

data(mscdata)
par.orig <- par(no.readonly=TRUE)
on.exit(par.orig)

dat <- mksub(mscdata, id=1108447)
dat.ss <- seas.sum(dat)

# Normalized by the number of days in each bin
plot(dat.ss)

# Normalized by the number of active days in each bin
plot(dat.ss, norm="active")

# Snow, using a different start day, and a better y-axis:
dat2.ss <- seas.sum(dat, var="snow", width="mon",
                    start.day=as.Date("2000-08-01"))
par(yaxs="i")
plot(dat2.ss, var="snow")
plot(dat2.ss, var="snow", norm="active")



