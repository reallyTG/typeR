library(xts)


### Name: indexTZ
### Title: Query the TimeZone of an xts object
### Aliases: TimeZone indexTZ indexTZ<- tzone tzone<-
### Keywords: misc

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
indexTZ(x)

# same, preferred as of 0.9-1
tzone(x)
str(x)
x
# now set TZ to something different...
## Not run: 
##D Old.TZ <- Sys.getenv("TZ")
##D Sys.setenv(TZ="America/Chicago")
##D x
##D Sys.setenv(TZ=Old.TZ)
## End(Not run)



