library(timetools)


### Name: POSIXcti
### Title: Class '"POSIXcti"'
### Aliases: POSIXcti-class POSIXcti length,POSIXcti-method
###   show,POSIXcti-method [.POSIXcti [<-.POSIXcti print.POSIXcti
###   summary.POSIXcti head.POSIXcti tail.POSIXcti c.POSIXcti
###   unique.POSIXcti match,POSIXcti,POSIXcti-method
###   %in%,POSIXcti,POSIXcti-method split.POSIXcti rep.POSIXcti as.POSIXcti
###   as.POSIXcti.logical duration,POSIXcti-method format.POSIXcti
###   start.POSIXcti end.POSIXcti %included%.POSIXcti %intersect%.POSIXcti
###   Ops.POSIXcti <.POSIXcti <=.POSIXcti ==.POSIXcti !=.POSIXcti
###   >=.POSIXcti >.POSIXcti +,POSIXcti,POSIXctp-method
###   +,POSIXctp,POSIXcti-method -,POSIXcti,POSIXctp-method
### Keywords: classes

### ** Examples

  # time interval : january of year 2013
  jan <- POSIXcti('2013-01-01', '2013-02-01')
  jan

  # the complete year
  y2013 <- POSIXcti('2013-01-01', '2014-01-01')
  y2013

  # is jan in 2013 ?
  jan %included% y2013

  # intersection
  jan %intersect% y2013




