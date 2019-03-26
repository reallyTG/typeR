library(oce)


### Name: read.adv.nortek
### Title: Read an ADV data file
### Aliases: read.adv.nortek

### ** Examples

## Not run: 
##D library(oce)
##D # A nortek Vector file
##D d <- read.oce("/data/archive/sleiwex/2008/moorings/m05/adv/nortek_1943/raw/adv_nortek_1943.vec",
##D               from=as.POSIXct("2008-06-26 00:00:00", tz="UTC"),
##D               to=as.POSIXct("2008-06-26 00:00:10", tz="UTC"))
##D plot(d, which=c(1:3,15))
## End(Not run)



