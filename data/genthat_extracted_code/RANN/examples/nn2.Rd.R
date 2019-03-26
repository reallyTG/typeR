library(RANN)


### Name: nn2
### Title: Nearest Neighbour Search
### Aliases: nn2
### Keywords: nonparametric

### ** Examples


x1 <- runif(100, 0, 2*pi)
x2 <- runif(100, 0,3)
DATA <- data.frame(x1, x2)
nearest <- nn2(DATA,DATA)



