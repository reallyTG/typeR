library(segclust2d)


### Name: check_repetition
### Title: Check for exact repetition in the series
### Aliases: check_repetition

### ** Examples

set.seed(42) 
dat <- rbind(base::sample(seq(1,10),  size= 100, replace = TRUE),
             base::sample(seq(1,10),  size= 100, replace = TRUE))
check_repetition(dat, lmin = 3)
check_repetition(dat, lmin = 5)             



