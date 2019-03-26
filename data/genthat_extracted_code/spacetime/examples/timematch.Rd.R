library(spacetime)


### Name: timeMatch
### Title: match two (time) sequences
### Aliases: timeMatch timeMatch,ST,ST-method timeMatch,xts,xts-method
###   timeMatch,POSIXct,POSIXct-method timeMatch,Date,Date-method index
###   MATCH
### Keywords: manip

### ** Examples

t0 = as.POSIXct("1999-10-10")
x = t0 +c(0.5+c(2,2.1,4),5)*3600
y = t0 + 1:5 * 3600
x
y
#timeIsInterval(x) = FALSE
#timeIsInterval(y) = FALSE
timeMatch(x,y, returnList = FALSE)
timeMatch(x,y, returnList = TRUE)
#timeIsInterval(y) = TRUE
timeMatch(x,y, returnList = FALSE, end.y = delta(y))
timeMatch(x,y, returnList = TRUE, end.y = delta(y))
#timeIsInterval(x) = TRUE
timeMatch(x,y, returnList = FALSE, end.x = delta(x), end.y = delta(y))
timeMatch(x,y, returnList = TRUE, end.x = delta(x), end.y = delta(y))
#timeIsInterval(y) = FALSE
timeMatch(x,y, returnList = FALSE, end.x = delta(x))
timeMatch(x,y, returnList = TRUE, end.x = delta(x))

x = as.POSIXct("2000-01-01") + (0:9) * 3600
y = x + 1
y[1] = y[2]
x
y
TI = function(x, ti) { 
	timeIsInterval(x) = ti
	x 
}
#timeMatch(TI(y,FALSE),TI(y,FALSE))
#timeMatch(TI(y,TRUE), TI(y,TRUE))
#
#timeMatch(TI(x,FALSE),TI(y,FALSE))
#timeMatch(TI(x,FALSE),TI(y,TRUE))
#timeMatch(TI(x,TRUE), TI(y,FALSE))
#timeMatch(TI(x,TRUE), TI(y,TRUE))
#
#timeMatch(TI(x,FALSE),TI(y,FALSE), returnList = TRUE)
#timeMatch(TI(x,FALSE),TI(y,TRUE), returnList = TRUE)
#timeMatch(TI(x,TRUE), TI(y,FALSE), returnList = TRUE)
#timeMatch(TI(x,TRUE), TI(y,TRUE), returnList = TRUE)




