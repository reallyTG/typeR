library(seas)


### Name: mscdata
### Title: Meteorological Service of Canada sample climate data
### Aliases: mscdata
### Keywords: datasets

### ** Examples

data(mscstn)
data(mscdata)
par.orig <- par(no.readonly=TRUE)

# structure in R
str(mscdata)

# first few rows
head(mscdata)

# here are all the station IDs
stnids <- levels(mscdata$id)

# show all data
rng.p <- range(mscdata$precip, na.rm=TRUE)
rng.t <- range(mscdata$t_mean, na.rm=TRUE)
par(mfcol=c(2, 3), mgp=c(2, 1, 0), mar=c(3, 3, 3, 1), bty="l")
for (n in levels(mscdata$id)) {
  dat <- mscdata[mscdata$id == n,]
  plot(t_mean ~ date, dat, "l", col="red", ylim=rng.t)
  abline(h=0)
  plot(precip ~ date, dat, "l", col="blue", ylim=rng.p, main=n)
}
par(par.orig)

# show stations and station names available in this data frame
data.frame(stnids, name=getstnname(stnids))
dat <- mksub(mscdata, id=1108447)
dat$month <- mkseas(dat, "mon")
plot(t_mean ~ date, dat, "l")
plot(t_mean ~ date, dat, subset=(month == "Dec"))
seas.temp.plot(dat)
year.plot(dat)

# plot high-resolution statistics
dly.tmp <- tapply(dat$t_mean, dat$yday,
  quantile, c(5, 25, 50, 75, 95) / 100, na.rm=TRUE)
dly <- data.frame(yday=1:366,
  t(matrix(unlist(dly.tmp), nrow=5)))
names(dly) <- c("yday", "d5", "d25", "median", "d75", "d95")
plot(median ~ yday, dly, "n", ylim=c(-5, 25),
  ylab="mean temperature", xlab="day of year")
polygon(c(1:366, 366:1), c(dly$d5, rev(dly$d95)),
        border=FALSE, col="grey80")
polygon(c(1:366, 366:1), c(dly$d25, rev(dly$d75)),
        border=FALSE, col="grey50")
lines(median ~ yday, dly)
abline(h=0)



