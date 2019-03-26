library(Ecfun)


### Name: asNumericDF
### Title: Coerce to numeric dropping commas and info after a blank
### Aliases: asNumericChar asNumericDF
### Keywords: manip

### ** Examples

##
## 1.  an example 
##
xDate <- as.Date('1970-01-01')+c(0, 365)
xPOSIX <- as.POSIXct(xDate)+c(1, 99)
fakeF1 <- data.frame(yr=c('1948', '1947 (1)'),
            q1=c(' 1,234 ', ''), duh=rep(NA, 2), 
            dol=c('$1,234', ''), 
            pct=c('1%', '2%'), 
            xDate=as.character(xDate, format='%m-%d-%Y'), 
            xPOSIX=as.character(xPOSIX), 
            junk=c('this is','junk'))
# This converts the last 3 columns to NAs and drops them:   

str(nF1.1 <- asNumericChar(fakeF1$yr))
str(nF1.2 <- asNumericChar(fakeF1$q1))
str(nF1.3 <- asNumericChar(fakeF1$duh))

nF1 <- asNumericDF(fakeF1)
nF2 <- asNumericDF(fakeF1, Dates='xDate', POSIX='xPOSIX', 
        ignore='junk')

# check 
nF1. <- data.frame(yr=asNumericChar(fakeF1$yr),
                   q1=asNumericChar(fakeF1$q1), 
                   dol=asNumericChar(fakeF1$dol), 
                   pct=c(.01, .02))

nF1c <- data.frame(yr=1948:1947, q1=c(1234, NA), 
                   dol=c(1234, NA), pct=c(.01, .02))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nF1, nF1.)
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nF1., nF1c)
## Don't show: 
)
## End(Don't show)

nF2c <- data.frame(yr=1948:1947, q1=c(1234, NA), 
            dol=c(1234, NA), pct=c(.01, .02), 
            xDate=xDate, xPOSIX=xPOSIX, 
            junk=fakeF1$junk)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nF2, nF2c)
## Don't show: 
)
## End(Don't show)

##
## 2.  orderBy=1:2
##
nF. <- asNumericDF(fakeF1, orderBy=1:2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nF., nF1c[2:1,])
## Don't show: 
)
## End(Don't show)



