library(ICGE)


### Name: proxi
### Title: Proximity Function
### Aliases: proxi
### Keywords: multivariate

### ** Examples

data(iris)
d <- dist(iris[,1:4])

# xo contains a unit from one group, as for example group 1.
x0 <- c(5.3, 3.6, 1.1, 0.1) 
# distances between x0 and the other units.
dx0 <- rep(0,150)
for (i in 1:150){
	dif <-x0-iris[i,1:4]
	dx0[i] <- sqrt(sum(dif*dif))
}

proxi(d, dx0, iris[,5])


# xo contains a unit from one group, as for example group 2.
x0 <- c(6.4, 3.0, 4.8, 1.3) 
# distances between x0 and the other units.
dx0 <- rep(0,150)
for (i in 1:150){
	dif <-x0-iris[i,1:4]
	dx0[i] <- sqrt(sum(dif*dif))
}

proxi(d, dx0, iris[,5])



