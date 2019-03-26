library(SWMPr)


### Name: plot.swmpr
### Title: Plot swmpr data
### Aliases: plot.swmpr lines.swmpr

### ** Examples

## get data
data(apadbwq)
swmp1 <- apadbwq

## subset
dat <- subset(swmp1, select = 'do_mgl', 
 subset = c('2013-07-01 00:00', '2013-07-31 00:00'))

## plot using swmpr method, note default line plot
plot(dat)

## plot using formula method
plot(do_mgl ~ datetimestamp, dat)

## plot using defualt, add lines
plot(dat, type = 'n')
lines(dat, col = 'red')



