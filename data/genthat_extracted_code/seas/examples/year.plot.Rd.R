library(seas)


### Name: year.ploy
### Title: Plot annual temperature and precipitation statistics
### Aliases: year.plot plot.year
### Keywords: hplot

### ** Examples

data(mscdata)

year.plot(mksub(mscdata, id=1108447))

year.plot(mksub(mscdata, id=1108447,
                start=as.Date("1975-08-01"),
                end=as.Date("2004-07-31")),
          start.day=as.Date("2000-08-01"))



