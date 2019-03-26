library(phenofit)


### Name: add_HeadTail
### Title: Add one year data in the head and tail
### Aliases: add_HeadTail

### ** Examples

library(phenofit)
data("MOD13A1")

dt <- tidy_MOD13.gee(MOD13A1$dt)
st <- MOD13A1$st

sitename <- dt$site[1]
d     <- dt[site == sitename, ] # get the first site data
sp    <- st[site == sitename, ] # station point

nptperyear = 23
dnew     <- add_HeadTail(d, nptperyear = nptperyear) # add one year in head and tail




