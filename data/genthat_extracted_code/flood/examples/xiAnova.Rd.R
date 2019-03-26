library(flood)


### Name: xiAnova
### Title: Homogeneity test for the shape
### Aliases: xiAnova

### ** Examples

library("evd")
# sample observations of 100 years at 5 stations:
set.seed(1053)
x19 <- matrix(rgev(400, 2, 1, 0.1), ncol=4) # 4 stations with the same shape
x10 <- rgev(100, 2, 1, 0.4) # one station with a different shape
x <- cbind(x19, x10)
xiAnova(x=x, leftrim=0, rightrim=1)



