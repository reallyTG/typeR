library(IDPmisc)


### Name: rose
### Title: Creates a rose object out of circular data
### Aliases: rose
### Keywords: category dplot

### ** Examples

## artificial example:
## concentration of A and B as function of
## hour of day (hour) and wind direction (WD)
hour <- rep(0:23,100)
dat <- data.frame(hour = hour,
                  A =    (2*cos((hour+6)/6*pi)+rnorm(24*100,1))^2,
                  B =    (2*cos((hour+4)/6*pi)+rnorm(24*100,1,2))^2,
                  WD =   rnorm(24*100,
                           mean=sample(c(190,220,50),24*100, replace = TRUE),
                           sd=30)%%360)

## two different responses, scalar summary function
mean.windrose <- rose(dat[,c("A","B")],
                      cyclVar=dat$WD,
                      circle=360,
                      FUN=mean, na.rm=TRUE)
mean.windrose

## one response, vectorial summary function
quant.dayrose <- rose(dat$A,
                      cyclVar=dat$hour,
                      n.cyclVar=24, circle=24,
                      FUN=quantile, na.rm=TRUE)
quant.dayrose


mean.windroseB <- rose(dat[,c("A")],
                       cyclVar=dat$WD,
                       circle=360,
                       cut=dat$B,
                       breaks=c(0,30,100),
                       dig.lab=3,
                       FUN=mean, na.rm=TRUE)
mean.windroseB




