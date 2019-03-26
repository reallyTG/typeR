library(astroFns)


### Name: ymd2jd
### Title: Year, month, day to 0h on Julian day
### Aliases: ymd2jd
### Keywords: chron

### ** Examples

# Ensure enough digits to see result, then return to previous value
dig <- getOption('digits')
options(digits=16)
ymd2jd(yr=2000, mo=1, dy=1)
ymd2jd(yr=2000, mo=1, dy=1.3)  # rounds to nearest day
options(digits=dig)
jd2ymd(ymd2jd(yr=2000, mo=1, dy=1))



