## ----setup, include=FALSE------------------------------------------------
library(h5)
library(zoo)
if (file.exists('test.h5')) file.remove('test.h5')

## ----firststeps----------------------------------------------------------
f <- h5file('test.h5')
g1 <- f['group1']
g1['mat'] <- matrix(1:9, nrow = 3)
g1['mat2'] <- matrix(11:19, nrow = 3)
h5attr(g1, 'attr1') <- 'This is Group 1'
f['group2/mat3'] <- matrix(21:29, nrow = 3)
sapply(list.datasets(f), function(x) f[x][, 1])
h5close(f)

## ----pandas2, eval=FALSE-------------------------------------------------
#  f <- h5file('ex-pandas.h5', 'r')
#  dates <- as.Date(f['testset/axis1'][1:3],
#    origin = '0001-01-01') - 1
#  zoo(f['testset/block0_values'][1:3, ], order.by=dates)

## ----cleanup, include=FALSE----------------------------------------------
if (file.exists('test.h5')) file.remove('test.h5')

