library(seas)


### Name: mkann
### Title: Make annum from a date
### Aliases: mkann
### Keywords: utilities datagen ts

### ** Examples

data(mscdata)
dat <- mksub(mscdata, id=1108447)
dat$ann1 <- mkann(dat, start.day=1)
dat$ann2 <- mkann(dat, start.day=as.Date("2000-02-01"))
dat$ann3 <- mkann(dat, start.day=as.Date("2000-08-01"))
table(dat$ann1)
table(dat$ann2)
table(dat$ann3)
dat[26:36, c("date", paste("ann", 1:3, sep=""))]



