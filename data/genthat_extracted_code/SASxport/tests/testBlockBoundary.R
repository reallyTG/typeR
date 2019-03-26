##  This script tests an edge case where a dataset ends exactly on a
##  block boundery.  Previously, this could lead to an error in
##  loading the created data file.

library(SASxport)
Sys.setenv("TZ"="GMT")

events <- read.csv('events.csv')
exposure <- read.csv('exposure.csv')
events
exposure


write.xport(events,exposure,file='dat.xpt')
write.xport(exposure,events,file='tad.xpt')

l1.s <- SASxport::lookup.xport('dat.xpt')
l2.s <- SASxport::lookup.xport('tad.xpt')

stopifnot( identical( l1.s$EXPOSURE, l2.s$EXPOSURE) ) 
stopifnot( identical( l1.s$EVENTS,   l2.s$EVENTS  ) )

d1.s <- SASxport::read.xport(file='dat.xpt')
d2.s <- SASxport::read.xport(file='tad.xpt')

stopifnot( identical( d1.s$EXPOSURE, d2.s$EXPOSURE) )
stopifnot( identical( d1.s$EVENTS,   d2.s$EVENTS)   )








