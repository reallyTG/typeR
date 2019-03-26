library(dbstats)


### Name: disttoD2
### Title: Distance conversion: dist to D2
### Aliases: disttoD2

### ** Examples


X <- matrix(rnorm(100*3),nrow=100)
distance <- daisy(X,"manhattan")
D2 <- disttoD2(distance)




