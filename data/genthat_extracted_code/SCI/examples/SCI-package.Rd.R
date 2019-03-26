library(SCI)


### Name: SCI-package
### Title: Standardized Climate Indices Such as SPI, SRI or SPEI
### Aliases: SCI-package SCI
### Keywords: package

### ** Examples

## create artificial data, resembling precipitation
set.seed(101)
n.years <- 60
date <- rep(1:n.years,each=12) + 1950 + rep((0:11)/12,times=n.years)
PRECIP <- (0.25*sin( 2 * pi * date) + 0.3)*rgamma(n.years*12, shape = 3, scale = 1)
PRECIP[PRECIP<0.1] <- 0

## apply SCI transformation
spi.para <- fitSCI(PRECIP,first.mon=1,time.scale=6,distr="gamma",p0=TRUE)
spi <- transformSCI(PRECIP,first.mon=1,obj=spi.para)
plot(date,spi,t="l")



