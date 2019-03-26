library(pryr)


### Name: track_copy
### Title: Track if an object is copied
### Aliases: track_copy

### ** Examples

a <- 1:5
track_a <- track_copy(a)
track_a()
a[3] <- 3L
track_a()
a[3] <- 3
track_a()
rm(a)
track_a()



