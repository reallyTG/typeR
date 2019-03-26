library(queuecomputer)


### Name: as.server.list
### Title: Creates a '"server.list"' object from a list of times and
###   starting availability.
### Aliases: as.server.list

### ** Examples

# Create a server.list object with the first server available anytime before time 10,
# and the second server available between time 15 and time 30.
as.server.list(list(10, c(15,30)), c(1,0))



