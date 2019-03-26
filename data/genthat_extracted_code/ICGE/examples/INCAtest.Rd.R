library(ICGE)


### Name: INCAtest
### Title: INCA Test
### Aliases: INCAtest print.incat summary.incat
### Keywords: multivariate cluster

### ** Examples
#generate 3 clusters, each of them with 20 objects in dimension 5.
mu1 <- sample(1:10, 5, replace=TRUE)
x1 <- matrix(rnorm(20*5, mean = mu1, sd = 1),ncol=5, byrow=TRUE)
mu2 <- sample(1:10, 5, replace=TRUE)
x2 <- matrix(rnorm(20*5, mean = mu2, sd = 1),ncol=5, byrow=TRUE)
mu3 <- sample(1:10, 5, replace=TRUE)
x3 <- matrix(rnorm(20*5, mean = mu3, sd = 1),ncol=5, byrow=TRUE)
x <- rbind(x1,x2,x3)

# Euclidean distance between units in matrix x.
d <- dist(x)
# given the right partition
partition <- c(rep(1,20), rep(2,20), rep(3,20))

# x0 contains a unit from one group, as for example group 1.
x0 <-  matrix(rnorm(1*5, mean = mu1, sd = 1),ncol=5, byrow=TRUE)

# distances between x0 and the other units.
dx0 <- rep(0,60)
for (i in 1:60){
	dif <-x0-x[i,]
	dx0[i] <- sqrt(sum(dif*dif))
}

INCAtest(d, partition, dx0, np=10)


# x0 contains a unit from a new group.
x0 <-  matrix(rnorm(1*5, mean = sample(1:10, 5, replace=TRUE),
        sd = 1), ncol=5, byrow=TRUE)

# distances between x0 and the other units in matrix x.
dx0 <- rep(0,60)
for (i in 1:60){
	dif <-x0-x[i,]
	dx0[i] <- sqrt(sum(dif*dif))
}

INCAtest(d, partition, dx0, np=10)




