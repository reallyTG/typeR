library(bReeze)


### Name: timestamp
### Title: Format time stamps
### Aliases: timestamp ts
### Keywords: methods

### ** Examples

## Not run: 
##D # load and prepare data
##D data("winddata", package="bReeze")
##D 
##D # format time stamp
##D timestamp <- timestamp(timestamp=winddata[,1])
##D 
##D # format time stamp with given pattern
##D timestamp.2 <- timestamp(timestamp=winddata[,1], "%d.%m.%Y %H:%M")
##D 
##D # wrong pattern (##D 
##D timestamp.2 <- timestamp(timestamp=winddata[,1], "%d.%m.%y %H:%M")
##D 
##D # strange time stamp pattern
##D ts <- c("TS 08/2012-10 8h10m30s", "TS 08/2012-10 8h20m30s", 
##D   "TS 08/2012-10 8h30m30s")
##D timestamp.3 <- timestamp(timestamp=ts)	# pattern not found
##D timestamp.3 <- timestamp(timestamp=ts, "TS %m/%Y-%d %Hh%Mm%Ss")
##D 
##D # time zones
##D # manually define time zone
##D timestamp.4 <- timestamp(timestamp=winddata[,1], tz="CET")
##D 
##D # get time zone from timestamp
##D timestamp.5 <- timestamp(timestamp="2012-08-08 22:55 GMT", tz="?")
## End(Not run)



