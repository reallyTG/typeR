library(CHsharp)


### Name: sharp1d
### Title: Data Sharpening for Density Estimation
### Aliases: sharp1d
### Keywords: models

### ** Examples

# Example 1:
y <- c(rnorm(50,-1,1),rnorm(50,2,2), rnorm(100,0,.5))
data.sharp1 <- sharp1d(y,5,1)
data.sharp2 <- sharp1d(y,5,2)
# original data:
plot(density(y, bw=5))
# sharpened data after 1 iterations:
lines(density(data.sharp1, bw=5), col=2)
# sharpened data after 2 iterations:
lines(density(data.sharp2, bw=5), col=4)

x <- rt(100, df=3)
h <- dpik(x)

# Example 2:
curve(dt(x, df=3), from=-4, to=4)
lines(bkde(x, bandwidth=h), col=2, lty=2)

x.sharp <- sharp1d(x, h, 1)
lines(bkde(x.sharp, bandwidth=h), col=3, lty=3)

x.sharp2 <- sharp1d(x, h, 2)
lines(bkde(x.sharp2, bandwidth=h), col=4, lty=4)

x.sharp3 <- sharp1d(x, h, 3)
lines(bkde(x.sharp3, bandwidth=h), col=5, lty=5)



