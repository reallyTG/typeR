library(OSMscale)


### Name: checkLL
### Title: lat-long coordinate check
### Aliases: checkLL

### ** Examples

checkLL(lat=52, long=130)
checkLL(130, 52, fun=message)
checkLL(85:95, 0, fun=message)

d <- data.frame(x=0, y=0)
checkLL(y,x, d)

# informative errors:
library("berryFunctions")
is.error(   checkLL(85:95, 0, fun="message"),  tell=TRUE)
is.error(   checkLL(170,35),  tell=TRUE)

mustfail <- function(expr) stopifnot(berryFunctions::is.error(expr))
mustfail( checkLL(100)         )
mustfail( checkLL(100, 200)    )
mustfail( checkLL(-100, 200)   )
mustfail( checkLL(90.000001, 0)   )




