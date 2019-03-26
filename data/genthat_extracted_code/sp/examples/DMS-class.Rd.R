library(sp)


### Name: DMS-class
### Title: Class "DMS" for degree, minute, decimal second values
### Aliases: DMS-class print.DMS show,DMS-method coerce,DMS-method
###   as.double.DMS as.numeric.DMS
### Keywords: classes spatial

### ** Examples

data(state)
dd2dms(state.center$x)
dd2dms(state.center$y, NS=TRUE)
as.numeric(dd2dms(state.center$y))
as(dd2dms(state.center$y, NS=TRUE), "numeric")
as.numeric.DMS(dd2dms(state.center$y))
state.center$y



