library(samr)


### Name: samr.norm.data
### Title: output normalized sequencing data
### Aliases: samr.norm.data
### Keywords: univar

### ** Examples

set.seed(100)
mu <- matrix(100, 1000, 20)
mu[1:100, 11:20] <- 200
mu <- scale(mu, center=FALSE, scale=runif(20, 0.5, 1.5))
x <- matrix(rpois(length(mu), mu), 1000, 20)
y <- c(rep(1, 10), rep(2, 10))
data=list(x=x,y=y, geneid=as.character(1:nrow(x)),
genenames=paste("g",as.character(1:nrow(x)),sep=""))
x.norm <- samr.norm.data(data$x)



