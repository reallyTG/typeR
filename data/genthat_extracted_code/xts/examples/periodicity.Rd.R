library(xts)


### Name: periodicity
### Title: Approximate Series Periodicity
### Aliases: periodicity
### Keywords: utilities

### ** Examples

zoo.ts <- zoo(rnorm(231),as.Date(13514:13744,origin="1970-01-01"))
periodicity(zoo.ts)



