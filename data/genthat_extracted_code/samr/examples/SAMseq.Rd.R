library(samr)


### Name: SAMseq
### Title: Significance analysis of sequencing data - simple user interface
### Aliases: SAMseq
### Keywords: univar survival ts nonparametric

### ** Examples


######### two class unpaired comparison
set.seed(100)
mu <- matrix(100, 1000, 20)
mu[1:100, 11:20] <- 200
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
y <- c(rep(1, 10), rep(2, 10))

samfit <- SAMseq(x, y, resp.type = "Two class unpaired") 

# examine significant gene list
print(samfit)

# plot results
plot(samfit)

######### two class paired comparison
set.seed(100)
mu <- matrix(100, 1000, 20)
mu[1:100, 11:20] <- 200
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
y <- c(-(1:10), 1:10)

samfit <- SAMseq(x, y, resp.type = "Two class paired") 

# examine significant gene list
print(samfit)

# plot results
plot(samfit)

######### Multiclass comparison
set.seed(100)
mu <- matrix(100, 1000, 20)
mu[1:20, 1:5] <- 120
mu[21:50, 6:10] <- 80
mu[51:70, 11:15] <- 150
mu[71:100, 16:20] <- 60
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
y <- c(rep(1:4, rep(5, 4)))

samfit <- SAMseq(x, y, resp.type = "Multiclass") 

# examine significant gene list
print(samfit)

# plot results
plot(samfit)

######### Quantitative comparison
set.seed(100)
mu <- matrix(100, 1000, 20)
y <- runif(20, 1, 3)
mu[1 : 100, ] <- matrix(rep(100 * y, 100), ncol=20, byrow=TRUE)
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
samfit <- SAMseq(x, y, resp.type = "Quantitative")

# examine significant gene list
print(samfit)

# plot results
plot(samfit)

######### Survival comparison
set.seed(100)
mu <- matrix(100, 1000, 20)
y <- runif(20, 1, 3)
mu[1 : 100, ] <- matrix(rep(100 * y, 100), ncol=20, byrow=TRUE)
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
y <- y + runif(20, -0.5, 0.5)
censoring.status <- as.numeric(y < 2.3)
y[y >= 2.3] <- 2.3
samfit <- SAMseq(x, y, censoring.status = censoring.status, 
resp.type = "Survival")

# examine significant gene list
print(samfit)

# plot results
plot(samfit)



