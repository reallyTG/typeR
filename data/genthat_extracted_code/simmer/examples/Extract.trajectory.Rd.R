library(simmer)


### Name: Extract.trajectory
### Title: Extract or Replace Parts of a Trajectory
### Aliases: Extract.trajectory [.trajectory [[.trajectory [<-.trajectory
###   [[<-.trajectory

### ** Examples

x <- join(lapply(1:12, function(i)
  trajectory() %>% timeout(i)
))
x

x[10]                 # the tenth element of x
x[-1]                 # delete the 1st element of x
x[c(TRUE, FALSE)]     # logical indexing
x[c(1, 5, 2, 12, 4)]  # numeric indexing
x[c(FALSE, TRUE)] <- x[c(TRUE, FALSE)] # replacing
x




