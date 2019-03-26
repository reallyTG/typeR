library(splusTimeDate)


### Name: timeSpan-class
### Title: Time Span Class
### Aliases: timeSpan-class +,positionsCalendar,timeSpan-method
###   +,timeSpan,timeSpan-method +,timeSpan,positionsCalendar-method
###   +,timeSpan,missing-method -,positionsCalendar,timeSpan-method
###   -,timeSpan,timeSpan-method -,timeSpan,missing-method
###   /,timeSpan,timeSpan-method Compare,numeric,timeSpan-method
###   Compare,timeSpan,numeric-method Math2,timeSpan-method
###   Math,timeSpan-method Ops,ANY,timeSpan-method Ops,timeSpan,ANY-method
###   Ops,timeSpan,timeSpan-method Summary,timeSpan-method
###   as.character,timeSpan-method coerce,numeric,timeSpan-method
###   coerce,timeSpan,integer-method coerce,timeSpan,numeric-method
###   coerce,character,timeSpan-method coerce,timeSpan,character-method
###   cor,ANY,timeSpan-method cor,timeSpan,ANY-method
###   cor,timeSpan,timeSpan-method cumsum,timeSpan-method
###   cut,timeSpan-method diff,timeSpan-method format,timeSpan-method
###   hms,timeSpan-method hours,timeSpan-method minutes,timeSpan-method
###   seconds,timeSpan-method match,ANY,timeSpan-method
###   match,character,timeSpan-method match,timeSpan,ANY-method
###   match,timeSpan,character-method match,timeSpan,timeSpan-method
###   max,timeSpan-method mean,timeSpan-method median,timeSpan-method
###   min,timeSpan-method quantile,timeSpan-method range,timeSpan-method
###   show,timeSpan-method sort.list,timeSpan-method sort,timeSpan-method
###   summary,timeSpan-method sum,timeSpan-method
###   timeCeiling,timeSpan-method timeTrunc,timeSpan-method
###   timeFloor,timeSpan-method var,ANY,timeSpan-method
###   var,timeSpan,ANY-method
### Keywords: chron classes

### ** Examples

## The default format for input is initially:
##   "[%yy[ear[s]][,]] [%dd[ay[s]][,]] [%Hh[our[s]][,]]
##      [%Mm[in[ute][s]][,]] [%Ss[ec[ond][s]][,]] [%NM[s][S]]"
##This allows reading strings such as
##   "378d 21h 04min 36s 365MS", "378 d", "-1y, -13d, -21h -4m"
##The default format for output is initially:
##   "%dd %Hh %Mm %Ss %NMS"
##This results in output such as:
##   "378d 21h 4m 36s 365MS"   "-378d -21h -4m -36s -365MS"



