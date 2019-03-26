library(wakefield)


### Name: group
### Title: Generate Random Vector of Control/Treatment Groups
### Aliases: group
### Keywords: group

### ** Examples

group(10)
100*table(group(n <- 10000))/n
100*table(group(n <- 10000, prob = c(.3, .7)))/n



