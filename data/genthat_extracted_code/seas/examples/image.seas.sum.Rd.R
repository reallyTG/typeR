library(seas)


### Name: image.seas.sum
### Title: Show a seasonal sum data object
### Aliases: image.seas.sum
### Keywords: hplot

### ** Examples

data(mscdata)
dat <- mksub(mscdata, id=1108447)

dat.ss <- seas.sum(dat, width="mon")
image(dat.ss)

image(dat.ss, contour=FALSE)

image(dat.ss, norm="active", start=6, rep=5)

# different start day (not Jan 1st)
dat2.ss <- seas.sum(dat, start.day=as.Date("2001-08-01"))
image(dat2.ss)
image(dat2.ss, power=2)
image(dat2.ss, palette=rainbow(64), main=NA)  # no title
image(dat2.ss, palette=colorRampPalette(c("white", "darkgreen"))(16))
image(dat2.ss, "snow")
image(dat2.ss, "snow", power=0.5)

# growing degree days for 10 degC
dat$gdd10 <- dat$t_mean - 10
dat$gdd10[dat$gdd10 < 0] <- 0
attr(dat$gdd10,"long.name") <- "growing degree days"
dat3.ss <- seas.sum(dat, var="gdd10")
image(dat3.ss, "gdd10", palette=colorRampPalette(c("white", "red"))(64))



