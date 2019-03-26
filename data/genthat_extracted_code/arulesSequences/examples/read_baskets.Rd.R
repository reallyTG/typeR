library(arulesSequences)


### Name: read_baskets
### Title: Read Transaction Data
### Aliases: read_baskets
### Keywords: file

### ** Examples

## read example data
x <- read_baskets(con  = system.file("misc", "zaki.txt", package = 
                                     "arulesSequences"),
		  info = c("sequenceID","eventID","SIZE"))
as(x, "data.frame")

## Not run: 
##D ## calendar dates
##D transactionInfo(x)$Date <-
##D     as.Date(transactionInfo(x)$eventID, origin = "2015-04-01")
##D transactionInfo(x)
##D all.equal(transactionInfo(x)$eventID,
##D           as.integer(transactionInfo(x)$Date - as.Date("2015-04-01")))
## End(Not run)



