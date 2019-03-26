library(SWMPr)


### Name: na.approx.swmpr
### Title: Linearly interpolate gaps
### Aliases: na.approx.swmpr

### ** Examples

data(apadbwq)
dat <- qaqc(apadbwq)
dat <- subset(dat, select = 'do_mgl', 
 subset = c('2013-01-22 00:00', '2013-01-26 00:00'))

# interpolate, maxgap of 10 records
fill1 <- na.approx(dat, params = 'do_mgl', maxgap = 10)

# interpolate maxgap of 30 records
fill2 <- na.approx(dat, params = 'do_mgl', maxgap = 30)

# plot for comparison
par(mfrow = c(3, 1))
plot(fill1, col = 'red', main = 'Interpolation - maximum gap of 10 records')
lines(dat)
plot(fill2, col = 'red', main = 'Interpolation - maximum gap of 30 records')
lines(dat)



