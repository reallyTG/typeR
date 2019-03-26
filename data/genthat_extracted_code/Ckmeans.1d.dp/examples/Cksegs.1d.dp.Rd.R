library(Ckmeans.1d.dp)


### Name: Univariate Segmentation
### Title: Optimal Univariate Segmentation
### Aliases: 'Univariate Segmentation' Cksegs.1d.dp
### Keywords: univar cluster

### ** Examples

# Ex 1. Segmenting by y

y <- c(1,1,1,2,2,2,4,4,4,4)

res <- Cksegs.1d.dp(y, k=c(1:10))

main <- "k-segs giving 3 clusters\nsucceeded in finding segments"

opar <- par(mfrow=c(1,2))

plot(res, main=main, xlab="x")

res <- Ckmeans.1d.dp(x=seq_along(y), k=c(1:10), y)
main <- "Weighted k-means giving 1 cluster\nfailed to find segments"

plot(res, main=main, xlab="x")

par(opar)

# Ex 2. Segmenting by y

y <- c(1,1,1.1,1, 2,2.5,2, 4,5,4,4)
res <- Cksegs.1d.dp(y, k=c(1:10))
plot(res, xlab="x")

# Ex 3. Segmenting a sinusoidal curve by y
x <- 1:125
y <- sin(x * .2)
res.q <- Cksegs.1d.dp(y, k=8, x=x)
plot(res.q, lwd=3, xlab="x")

# Ex 4. Segmenting by y

y <- rep(c(1,-3,4,-2), each=20)
y <- y + 0.5*rnorm(length(y))
k <- 1:10
res.q <- Cksegs.1d.dp(y, k=k, method="quadratic")
main <- paste("Cksegs (method=\"quadratic\"):\ntot.withinss =",
              format(res.q$tot.withinss, digits=4), "BIC =",
              format(res.q$BIC[length(res.q$size)], digits=4),
              "\nGUARANTEE TO BE OPTIMAL")
plot(res.q, main=main, xlab="x")
res.l <- Cksegs.1d.dp(y, k=k, method="linear")
main <- paste("Cksegs (method=\"linear\"):\ntot.withinss =",
               format(res.l$tot.withinss, digits=4), "BIC =",
              format(res.l$BIC[length(res.l$size)], digits=4),
               "\nFAST BUT MAY NOT BE OPTIMAL")
plot(res.l, main=main, xlab="x")
res.g <- Cksegs.1d.dp(y, k=k, method="loglinear")
main <- paste("Cksegs (method=\"loglinear\"):\ntot.withinss =",
              format(res.g$tot.withinss, digits=4), "BIC =",
              format(res.g$BIC[length(res.g$size)], digits=4),
              "\nFAST BUT MAY NOT BE OPTIMAL")
plot(res.g, main=main, xlab="x")



