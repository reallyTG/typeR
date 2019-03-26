library(readstata13)


### Name: as.caldays
### Title: Convert Stata business calendar dates in readable dates.
### Aliases: as.caldays

### ** Examples

# read business calendar and data
sp500 <- stbcal(system.file("extdata/sp500.stbcal", package="readstata13"))
dat <- read.dta13(system.file("extdata/statacar.dta", package="readstata13"))

# convert dates and check
dat$ldatescal2 <- as.caldays(dat$ldate, sp500)
all(dat$ldatescal2==dat$ldatescal)



