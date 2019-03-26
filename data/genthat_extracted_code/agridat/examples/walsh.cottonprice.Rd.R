library(agridat)


### Name: walsh.cottonprice
### Title: Acres and price of cotton 1910-1943
### Aliases: walsh.cottonprice
### Keywords: datasets

### ** Examples


data(walsh.cottonprice)
dat <- walsh.cottonprice

dat <- transform(dat, acres=acres/1000) # convert to million acres

percentchg <- function(x){ # percent change from previous to current
  ix <- 2:(nrow(dat))
  c(NA, (x[ix]-x[ix-1])/x[ix-1])
}

# Compare percent change in acres with percent change in previous price
# using constant dollars
dat <- transform(dat, chga = percentchg(acres), chgp = percentchg(adjcombined))

with(dat, cor(chga, chgp, use='pair')) # .501 correlation
require(lattice)
xyplot(chga~chgp, dat, type=c('p','r'),
       main="walsh.cottonprice",
       xlab="Percent change in previous price", ylab="Percent change in acres")



