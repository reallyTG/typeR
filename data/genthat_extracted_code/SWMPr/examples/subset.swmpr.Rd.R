library(SWMPr)


### Name: subset.swmpr
### Title: Subset a swmpr object
### Aliases: subset.swmpr

### ** Examples

## get data
data(apaebmet)
dat <- apaebmet

## subset records greater than or equal to a date
subset(dat, subset = '2013-01-01 0:00', operator = '>=')

## subset records within a date range, select two parameters
subset(dat, subset = c('2012-07-01 6:00', '2012-08-01 18:15'),
   select = c('atemp', 'totsorad'))



