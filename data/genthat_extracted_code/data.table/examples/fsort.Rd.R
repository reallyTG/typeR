library(data.table)


### Name: fsort
### Title: Fast parallel sort
### Aliases: fsort

### ** Examples

x = runif(1e6)
system.time(ans1 <- sort(x, method="quick"))
system.time(ans2 <- fsort(x))
identical(ans1, ans2)



