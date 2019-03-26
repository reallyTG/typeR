library(RSEIS)


### Name: posix2RSEIS
### Title: Posix to RSEIS DATE/TIME
### Aliases: posix2RSEIS
### Keywords: misc

### ** Examples

### make up a time:
P1 = as.POSIXct(Sys.time(), "America/New_York")  # in New York
R1 = posix2RSEIS(P1)
## also
unlist( as.POSIXlt(P1))  



