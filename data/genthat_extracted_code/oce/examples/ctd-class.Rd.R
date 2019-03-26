library(oce)


### Name: ctd-class
### Title: Class to Store CTD (or general hydrographic) Data
### Aliases: ctd-class

### ** Examples


# 1. Create a ctd object with fake data.
a <- as.ctd(salinity=35+1:3/10, temperature=10-1:3/10, pressure=1:3)
summary(a)

# 2. Fix a typo in a station latitude (fake! it's actually okay)
data(ctd)
ctd <- oceSetMetadata(ctd, "latitude", ctd[["latitude"]]-0.001,
                     "fix latitude typo in log book")




