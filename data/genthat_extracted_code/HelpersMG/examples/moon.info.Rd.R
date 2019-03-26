library(HelpersMG)


### Name: moon.info
### Title: Moon phase based on a date
### Aliases: moon.info
### Keywords: Lunar Lune Moon

### ** Examples

## Not run: 
##D library("HelpersMG")
##D moon.info(as.Date("2001-12-31"))
##D moon.info(as.Date("14/04/2010", "%d/%m/%Y"))
##D moon.info(as.Date("22/06/07", "%d/%m/%y"))
##D moon.info(seq(from=as.Date("2012-03-01"), 
##D 	to=as.Date("2012-04-15"), by="days"))
##D moon.info(seq(from=as.Date("2012-03-01"), 
##D 		to=as.Date("2012-04-15"), by="days"), phase=TRUE)
## End(Not run)



