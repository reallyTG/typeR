library(seas)


### Name: A1128551.DLY
### Title: MSC daily climate data file (DLY archive format) and
###   instructions for Canadian Daily Climate Data CD-ROMs for analysis
### Aliases: A1128551.DLY
### Keywords: datasets

### ** Examples

fname <- system.file("extdata", "A1128551.DLY", package="seas")
print(fname)
dat <- read.msc(fname)
head(dat)
str(dat)

seas.temp.plot(dat)
year.plot(dat)



