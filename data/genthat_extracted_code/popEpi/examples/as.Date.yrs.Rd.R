library(popEpi)


### Name: as.Date.yrs
### Title: Coerce Fractional Year Values to Date Values
### Aliases: as.Date.yrs

### ** Examples

data("sire", package = "popEpi")

## approximate year lengths: here 20 % have an extra day added
sire$dg_yrs <- get.yrs(sire$dg_date)
summary(sire$dg_yrs)
dg_date2 <- as.Date(sire$dg_yrs)
summary(as.numeric(dg_date2 - sire$dg_date))

## using actual year lengths
sire$dg_yrs <- get.yrs(sire$dg_date, year.length = "actual")
summary(sire$dg_yrs)
dg_date2 <- as.Date(sire$dg_yrs)
summary(as.numeric(dg_date2 - sire$dg_date))



