library(RTransProb)


### Name: cfdates
### Title: Create Date Squence
### Aliases: cfdates

### ** Examples

# Convert a date string to Matlab datenum format.
sdates <-  POSIXTomatlab(as.POSIXlt(as.Date("2000-01-01")))
edates <-  POSIXTomatlab(as.POSIXlt(as.Date("2002-01-01")))

cfdates(sdates, edates, 1)





