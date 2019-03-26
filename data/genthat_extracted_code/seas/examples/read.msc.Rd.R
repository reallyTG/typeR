library(seas)


### Name: read.msc
### Title: Read a MSC archive file into a data.frame
### Aliases: read.msc
### Keywords: file connection utilities

### ** Examples

fname <- system.file("extdata", "A1128551.DLY", package="seas")
print(fname)
dat <- read.msc(fname)
print(head(dat))

seas.temp.plot(dat)
year.plot(dat)

# Show how to convert from daily to monthly data
dat$yearmonth <- factor(paste(format(dat$date, "%Y-%m"), 15, sep="-"))
mlydat <- data.frame(date=as.Date(levels(dat$yearmonth)))
mlydat$year <- factor(format(mlydat$date, "%Y"))
mlydat$month <- mkseas(mlydat, "mon")

# means for temperature data
mlydat$t_max <- as.numeric(
    tapply(dat$t_max, dat$yearmonth, mean, na.rm=TRUE))
mlydat$t_min <- as.numeric(
    tapply(dat$t_min, dat$yearmonth, mean, na.rm=TRUE))
mlydat$t_mean <- as.numeric(
    tapply(dat$t_mean, dat$yearmonth, mean, na.rm=TRUE))

# sums for precipitation-related data
mlydat$rain <- as.numeric(
    tapply(dat$rain, dat$yearmonth, sum, na.rm=TRUE))
mlydat$snow <- as.numeric(
    tapply(dat$snow, dat$yearmonth, sum, na.rm=TRUE))
mlydat$precip <- as.numeric(
    tapply(dat$precip, dat$yearmonth, sum, na.rm=TRUE))
print(head(mlydat), 12)

# Show how to convert from a HLY file into daily summaries
## Not run: 
##D hlydat <- read.msc(bzfile("HLY11_L1127800.bz2"), flags=TRUE)
##D hlydat$date <- factor(hlydat$date)
##D 
##D # sum the solar radiation for each day to find the 'total daily'
##D sumdat <- tapply(hlydat$solar, hlydat$date, sum, na.rm=TRUE)
##D dlydat <- data.frame(date=as.Date(names(sumdat)),
##D                      solar=as.numeric(sumdat))
##D 
##D # sum the number of hours without measurements
##D sumdat <- tapply(hlydat$solar, hlydat$date,
##D                  function(v)(24 - sum(!is.na(v))))
##D dlydat$na <- as.integer(sumdat)
##D 
##D # quality control to remove days with less than 4 hours missing
##D Summerland <- dlydat[dlydat$na < 4,]
##D 
##D attr(Summerland$solar, "units") <- "W/(m^2*day)"
##D attr(Summerland$solar, "long.name") <- "Daily total global solar radiation"
##D seas.var.plot(Summerland, var="solar", col="yellow", width=5)
## End(Not run)



