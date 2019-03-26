library(SWMPr)


### Name: smoother
### Title: Smooth swmpr data
### Aliases: smoother smoother.default smoother.swmpr

### ** Examples

## import data
data(apadbwq)
swmp1 <- apadbwq

## qaqc and subset imported data
dat <- qaqc(swmp1)
dat <- subset(dat, subset = c('2012-07-09 00:00', '2012-07-24 00:00'))

## filter
test <- smoother(dat, window = 50, params = 'do_mgl')

## plot to see the difference
plot(do_mgl ~ datetimestamp, data = dat, type = 'l')
lines(test, select = 'do_mgl', col = 'red', lwd = 2)



