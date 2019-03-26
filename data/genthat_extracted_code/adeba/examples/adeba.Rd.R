library(adeba)


### Name: adeba
### Title: Make ADEBA density estimate
### Aliases: adeba

### ** Examples


# Univariate
x.train <- c(rnorm(20, 0, .5), rnorm(20, 2, 2))
f <- adeba(x.train, beta = 0:2/2)

curve((dnorm(x, 0, .5) + dnorm(x, 2, 2))/2, -2, 7, lwd=5, col="grey85")
plot(f, type="both", add=TRUE)
points(f)

# Bi-variate
x.train <- 3 + sweep(matrix(rnorm(60), 30), 2, 1:2, "*") %*% matrix(c(1, .4, .4, 1), 2)
x.test <- 3 + sweep(matrix(rnorm(40), 20), 2, 1:2, "*") %*% matrix(c(1, .4, .4, 1), 2)
f <- adeba(x.train, adaptive=FALSE)
f <- render(f)

plot(f, type="both")
points(x.test[,1], x.test[,2], cex=10*predict(f, x.test), pch=19)
legend("topleft", c("Traning", "Test"), pch=c(1,19), bg="white")

# Draw random sample from the estimated density
x.new <- radeba(400, f)
plot(f)
points(x.new[,1], x.new[,2])

# Slice the distribution
plot(0, 0, type="n", xlim=c(-4, 12), ylim=c(0, 0.15))
for(i in -6:16){
    f <- render(f, list(seq(-4, 12, length.out=200), i))
    plot(f, col=hsv(h=(i+6)/30), add=TRUE)
}
plot(f, type="data")

# See package `adebaExtra` for how to plot in full 3d




