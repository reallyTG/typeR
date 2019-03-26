library(oce)


### Name: concatenate,oce-method
### Title: Concatenate oce objects
### Aliases: concatenate,oce-method

### ** Examples

## 1. Split, then recombine, a ctd object.
data(ctd)
ctd1 <- subset(ctd, scan <= median(ctd[["scan"]]))
ctd2 <- subset(ctd, scan > median(ctd[["scan"]]))
CTD <- concatenate(ctd1, ctd2)

## 2. Split, then recombine, an adp object.
data(adp)
midtime <- median(adp[["time"]])
adp1 <- subset(adp, time <= midtime)
adp2 <- subset(adp, time > midtime)
ADP <- concatenate(adp1, adp2)

## Not run: 
##D ## 3. Download two met files and combine them.
##D met1 <- read.met(download.met(id=6358, year=2003, month=8))
##D met2 <- read.met(download.met(id=6358, year=2003, month=9))
##D MET <- concatenate(met1, met2)
## End(Not run)




