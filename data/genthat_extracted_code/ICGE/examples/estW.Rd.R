library(ICGE)


### Name: estW
### Title: INCA Statistic
### Aliases: estW print.incaest
### Keywords: multivariate

### ** Examples

data(iris)
d <- dist(iris[,1:4])

# characteristics of a specific flower (likely group 1)
x0 <- c(5.3, 3.6, 1.1, 0.1) 
# distances between  flower x0 and the rest of flowers in iris
dx0 <- rep(0,150)
for (i in 1:150){
	dif <-x0-iris[i,1:4]
	dx0[i] <- sqrt(sum(dif*dif))
}
estW(d, dx0, iris[,5])




