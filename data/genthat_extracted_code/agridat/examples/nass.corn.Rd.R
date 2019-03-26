library(agridat)


### Name: nass.corn
### Title: U.S. historical crop yields by state
### Aliases: nass.barley nass.corn nass.cotton nass.hay nass.rice
###   nass.sorghum nass.soybean nass.wheat
### Keywords: datasets

### ** Examples


data(nass.corn)
dat <- nass.corn

# Use only states that grew at least 100K acres of corn in 2011
keep <- droplevels(subset(dat, year == 2011 & acres > 100000))$state
dat <- droplevels(subset(dat, is.element(state, keep)))

# Acres of corn grown each year
require(lattice)
xyplot(acres ~ year|state, dat, type='l', as.table=TRUE,
       main="nass.corn: state trends in corn acreage")

## Plain levelplot, using only states
## require(reshape2)
## datm <- acast(dat, year~state, value.var='yield')
## redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
## levelplot(datm, aspect=.7, col.regions=redblue,
##           main="nass.corn",
##           scales=list(x=list(rot=90, cex=.7)))

# Model the rate of genetic gain in Illinois as a piecewise regression
# Breakpoints define periods of open-pollinated varieties, double-cross,
# single-cross, and transgenic hybrids.

dil <- subset(nass.corn, state=="Illinois" & year >= 1900)
m1 <- lm(yield ~ pmin(year,1932) + pmax(1932, pmin(year, 1959)) +
         pmax(1959, pmin(year, 1995)) + pmax(1995, year), dil)
signif(coef(m1)[-1],3) # Rate of gain for each segment
plot(yield ~ year, dil, main="nass.corn: piecewise linear model of Illinois corn yields")
lines(dil$year, fitted(m1))
abline(v=c(1932,1959,1995), col="wheat")




