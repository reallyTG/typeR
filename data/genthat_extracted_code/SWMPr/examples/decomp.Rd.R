library(SWMPr)


### Name: decomp
### Title: Simple trend decomposition
### Aliases: decomp decomp.swmpr decomp.default

### ** Examples


## get data
data(apadbwq)
swmp1 <- apadbwq

## subset for daily decomposition
dat <- subset(swmp1, subset = c('2013-07-01 00:00', '2013-07-31 00:00'))

## decomposition and plot
test <- decomp(dat, param = 'do_mgl', frequency = 'daily')
plot(test)

## dealing with missing values
dat <- subset(swmp1, subset = c('2013-06-01 00:00', '2013-07-31 00:00'))

## this returns an error
## Not run: 
##D test <- decomp(dat, param = 'do_mgl', frequency = 'daily')
## End(Not run)

## how many missing values?
sum(is.na(dat$do_mgl))

## use na.approx to interpolate missing data
dat <- na.approx(dat, params = 'do_mgl', maxgap = 10)

## decomposition and plot
test <- decomp(dat, param = 'do_mgl', frequency = 'daily')
plot(test)



