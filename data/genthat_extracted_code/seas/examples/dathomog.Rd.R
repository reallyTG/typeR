library(seas)


### Name: dathomog
### Title: Homogenize daily data sets
### Aliases: dathomog
### Keywords: utilities datagen

### ** Examples

data(mscdata)
dat1 <- mksub(mscdata, id=2100630)
dat2 <- mksub(mscdata, id=1108447)
year.plot(dat1)
year.plot(dat2)
newdata <- dathomog(dat1, dat2)
year.plot(newdata)
message(paste(c("This is a rather poor example, since the",
                "two stations are nowhere near each other"),
                collapse="\n"))



