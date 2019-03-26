library(seas)


### Name: mksub
### Title: Make a subset of seasonal data
### Aliases: mksub
### Keywords: datagen utilities

### ** Examples

data(mscdata)

# All available data from one station
summary(mksub(mscdata, id=1108447))

# One year
str(mksub(mscdata, id=1108447, start=1980))

# A range of years
str(mksub(mscdata, id=1108447, start=1980, end=1989))

# A range of dates
summary(mksub(mscdata, id=1108447,
              start=as.Date("1975-08-01"),
              end=as.Date("2000-07-31")))



