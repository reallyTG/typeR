library(trip)


### Name: adjust.duplicateTimes
### Title: Adjust duplicate DateTime values
### Aliases: adjust.duplicateTimes

### ** Examples



## DateTimes with a duplicate within ID
tms <- Sys.time() + c(1:6, 6, 7:10) *10
id <- rep("a", length(tms))
range(diff(tms))

## duplicate record is now moved one second forward
tms.adj <- adjust.duplicateTimes(tms, id)
range(diff(tms.adj))





